rlenanxi = 0
require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
function 线路判断(lastp)
-- B=1  C=2  H=3  F=4  G=5  K=6  J=7 E=8(中央)
	while true do
		if Base.IsColor(287,89,6349980) and lastp~=1 then return 1 end
		if Base.IsColor(239,242,6613670)and lastp~=2 then return 2 end
		if Base.IsColor(261,341,6613412)and lastp~=3 then return 3 end
		if Base.IsColor(449,79,6416032) and lastp~=4 then return 4 end
		if Base.IsColor(612,129,6218651)and lastp~=5 then return 5 end
		if Base.IsColor(553,280,6415774)and lastp~=6 then return 6 end
		if Base.IsColor(437,248,16775936)and lastp~=7 then return 7 end --线路
		if Base.IsColor(395,187,6415774)and lastp~=8 then return 8 end
		if 罗盘() then 罗盘处理() end
		Base.Sleep(100)
	end
end

function 战斗南西()
Base.Click(645,223)
Base.Sleep(500)
if 可以出击()==false then --不能出击，返回-1
	Win.Pop("不能出击！",true)
	return -1
end
Win.Print("出击2-3！")
Base.ClickRectEx(626,448,25,20)

罗盘处理()
Go_On=true
point=0
mstr="START"
-- B=1  C=2  H=3  F=4  G=5  K=6  J=7 E=8(中央)
while Go_On do --我还可以打
	point=线路判断(point)
	if     point==1 then --B
		mstr=mstr.."-B"
		Win.Print(mstr)
		Go_On = D战斗(1,false,true)
	elseif point==2 then --C
		mstr=mstr.."-C"
		Win.Print(mstr)
		Go_On = D战斗(1,false,true)
	elseif point==3 then --H
		mstr=mstr.."-H"
		Win.Print(mstr)
		Go_On = D战斗(1,false,true)
	elseif point==4 then --F
		mstr=mstr.."-F"
		Win.Print(mstr)
		Go_On = D战斗(1,false,false)
		return true
	elseif point==5 then --G BOSS点
		mstr=mstr.."-G"
		Win.Print(mstr)
		Go_On = D战斗(1,true,false)
		return true
	elseif point==6 then --K
		mstr=mstr.."-K"
		Win.Print(mstr)
		Go_On = D战斗(1,false,false)
		return true
	elseif point==7 then --J 结束
		mstr=mstr.."-J"
		Win.Print(mstr)
		Go_On = D战斗(1,false,false)
		return true
	elseif point==8 then --E
		mstr=mstr.."-E"
		Win.Print(mstr)
	end
	Base.Sleep(100)
end

Win.Print("出击：异常")
return Go_On

end

function mmm()
出击.执行(2, 3)
战斗南西()
补给.执行()
if rlenanxi==1 then Release() end
end

if nanxiexecute==nil then mmm() end