require("\\Lua\\Battle")

include_formedcag=true
require("\\Lua\\formedcga")
rl=0
hc=0

local iss=false
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
		Go_On = D战斗(1,true,false)
		break
	elseif point==5 then
		Win.Print("结束，未能进入BOSS")
		D战斗(1,false,true)
		break
	end
	Base.Sleep(100)
end


return true

end

if hc==1 then hcg[2]() end
出击.执行(3,3)
战斗33()
通用.等待母港(500)
补给.执行() 


if rl==1 then
通用.等待母港(500)
Base.ClickRectEx(399,460,10,5) --释放
end

if iss then
p("BOSS wo uchi to tta ri")
else
p("Failed")
end