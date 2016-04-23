require("\\Lua\\Battle")
require("\\Lua\\尝试远征")
include_修船=true
require("\\Lua\\明石修船")
--i added this 
include_formedcag=true
require("\\Lua\\formedcga")
rl=0
hc=0

local iss=false
local rest=5
function 线路判断(lastp)
	while true do
		if  lastp==1 then return 2 end
		if lastp==2 then return 2.5 end
		if Base.IsColor(498,276,6086807) and lastp~=3 then return 3 end
		if Base.IsColor(604,172,6416032) then return 4 end
		if Base.IsColor(303,163,5263431) then return 5 end
		if 罗盘() then 罗盘处理() end
		Base.Sleep(100)
	end
end

function 战斗33()
Base.Click(645,223)
Base.Sleep(500)
if 可以出击()==false then --不能出击，返回-1
	Win.Pop("不能出击！",true)
	--return -1
end
Win.Print("出击3-3！")
Base.ClickRectEx(626,448,25,20)
Go_On=true
point=1
while Go_On do --我还可以打
	point=线路判断(point)
	if     point<4 then
		Win.Print("非BOSS")
		Go_On = D战斗(1,false,true)
		if Go_On==0 then return true end
	elseif point==4 then --BOSS
		Win.Print("BOSS")
		iss=true
        rest=rest-1
		Go_On = D战斗(1,true,false)
		break
	elseif point==5 then
		Win.Print("结束，未能进入BOSS")
		D战斗(1,false,true)
		break
	end
	Base.Sleep(100)
end

if iss then
p("BOSS wo uchi to tta ri")
else
p("Failed")
end

return true

end


function D出击(出击策略 ) --table 换船f ,出击战斗f,修理f,等待时间,出击次数,结束f
--TODO:入参检验..
    if cjn==nil then --initial
        cjn = 1 --globa
        ended=false
        local ret=0
    end
    if ended then return end
    if (出击策略.出击次数>=1 and cjn>出击策略.出击次数) or (type(出击策略.结束f)=="function" and 出击策略.结束f()) then 
        ended=true
        if rep==1 then
        全部修理()
        end
        补给.执行(true)
        return
    end
    if 出击策略.等待时间>0 and cjn>1 then
        if os.time()<cj_last_time+出击策略.等待时间*60 then return end
    end
    Win.Print(("第:%d次"):format(cjn))
    ret = 补给.执行(true)
    if ret~=0 then
        if type(出击策略.修理f)=="function" then
            出击策略.修理f(ret)
        else 
            while ret~=0 do --default
                Win.Pop('大破或中破！',true)
                Kan.RepairEx(1,12,12)
                ret = 补给.执行(true)
            end
        end
    end

    通用.等待母港(1000)
    if type(出击策略.换船f)=="function" then
        出击策略.换船f() --TODO
        ret = 补给.执行(true)
    end
    if ret==0 then
        if type(出击策略.换船f)=="function" then
            出击策略.换船f("print_state")
        end
        通用.等待母港(2000)
        local k=出击策略.出击战斗f()
        if k==-10 then 
            刷新游戏()   --自动刷新
        end
        cjn=cjn+1
        cj_last_time = os.time()
    end
    通用.等待母港(2000)
end


function 出击and远征(出击策略)
    while true do 
        D出击(出击策略)
        尝试一次远征()
        Base.Sleep(1000*5)
		p("rest:",rest)
    end
end

if hc==1 then hcg[2]() end
出击and远征({换船f=nil ,出击战斗f=function() 出击.执行(3, 3) return 战斗33() end,修理f=0,等待时间=6,出击次数=0,结束f=function() return rest==0 end })