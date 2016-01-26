require("\\Lua\\Battle")
include_formedcag=true
require("\\Lua\\formedcga")
rl=1
hc=0

function 线路判断(lastp)
	while true do
		if  lastp==1 then return 2 end
		if lastp==2 then return 3 end
		if  lastp==3 then return 4 end
		if 罗盘() then 罗盘处理() end
		Base.Sleep(100)
	end
end

function 战斗16()
Base.Click(645,223)
Base.Sleep(500)
if 可以出击()==false then --不能出击，返回-1
	Win.Pop("不能出击！",true)
	--return -1
end
Base.ClickRectEx(626,448,25,20)
Win.Print("出击1-6！")
Go_On=true
point=1
while Go_On do --我还可以打
	point=线路判断(point)
	if     point==2 then
		Go_On = D战斗(5,false,true)
		罗盘处理()
	elseif point==3 then
		Go_On = D战斗(3,false,true)
	elseif point==4 then  --强行进击
		D战斗_强行进击(1,false)
		break
	end
	Base.Sleep(100)
end
waitsta(754,448,9868310)
tc(50,50)

return true

end

if hc==1 then hcg[11]() end
出击.执行(1,6)
战斗16()
补给.执行() 

if rl==1 then
通用.等待母港(2000)
Base.ClickRectEx(399,460,10,5) --释放
end
