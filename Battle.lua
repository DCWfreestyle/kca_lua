require("\\Lua\\BaseFunc")
--  require("\\Lua\\Battle")
-- 全局变量 有掉落 存在则为 1
-- EXPORT 罗盘()  罗盘处理() D战斗_强行进击(Formation,Night) 
--D战斗(Formation,Night,GoNextBattle)
local function 可以出击()
local count = {}
waitsta(529,421,0)
table.insert(count,0,{[0]=624,445,6140642}) 
return IsColorAll(count)
end

local function 进入战斗()
    array = {};
	count = {};
	
    array = {[0]=235,250,16777215}; count[0] = array;
	array = {[0]=246,209,215}; count[1] = array;
    return IsColorAll(count)
end

function 罗盘()
	--387,364
	x,y=Base.CallFunc("Base.FindColor","[6008824,5811705,5615096,5484025,5484025]")
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x==387 and y==364 then  return true end
	return false
end

local function 阵型()
	---426,185
	x,y=Base.CallFunc("Base.FindColor","[7236872,15922943,13948882,11777438,11777438]")
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x==-1 or y==-1 then return false end  
    return true
end

local function 存在大破()
	--323,254
	x,y=Base.CallFunc("Base.FindColor","[4408390,2829870,1053201,1316908,1712203]")
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x~=-1 and y~=-1 then return true end
    return false
end

local function 胜利失败()

	array = {}
	count = {}
		
	array = {[0]=52,46,12631325}
	count[0] = array
	array = {[0]=46,42,12631325}
	count[1] = array
	array = {[0]=50,42,7696928}
	count[2] = array
	array = {[0]=58,38,3289123}
	count[3] = array
	array = {[0]=6,144,2696199}
	count[4] = array
	array = {[0]=20,142,2564613}
	count[5] = array

	return IsColorAll(count)

end

local function 旗舰大破()
	--669,118
	x,y=Base.CallFunc("Base.FindColor","[1162,263571,459413,264063,262283]")
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x==669 and y==118 then return true end
    return false
end

local function 在夜战离脱判定()

	array = {}
	count = {}
	
	array = {[0]=122,49,12631325}
	count[0] = array
	array = {[0]=231,66,5853961}
	count[1] = array
	array = {[0]=251,40,2763046}
	count[2] = array
	array = {[0]=245,284,16513525}
	count[3] = array
	array = {[0]=315,250,16448502}
	count[4] = array
	array = {[0]=309,244,9335080}
	count[5] = array
	array = {[0]=311,264,5394214}
	count[6] = array
	array = {[0]=301,260,7559975}
	count[7] = array
	array = {[0]=295,260,9399314}
	count[8] = array

	return IsColorAll(count)

end

local function 战果报告()

    array = {};
	count = {};
	
    array = {[0]=396,91,15922943}; count[0] = array;
    array = {[0]=44,19,5393920}; count[3] = array;
	--40,33
	x,y=Base.CallFunc("Base.FindColor","[2565412,11315485,11973405,4407330,8157727,12631325,8157727,2565412,10723101]")
	
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x~=40 or y~=33 then return false end
    return IsColorAll(count)
end

local function 在进击撤退判定()
    array = {};
	count = {};
	array = {[0]=402,57,2694926}; count[0] = array;
	--462,287
	
	x,y=Base.CallFunc("Base.FindColor","[13872483,14069865,12952171,6050630,6380352,6248253,15063244,16777209,12825769,9931385]")
	
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x~=462 or y~=287 then return false end
    return IsColorAll(count)
end

local function 掉落()
	--352,450
	x,y=Base.CallFunc("Base.FindColor","[1577991,1906956,2499093,3288609,3814953,3880746,3551781,3222816,2762773,3025945,3420703,3683875,3683875,3420703,3025945]")
	
	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x~=352 or y~=450 then return false end
    return true
end

local function 资源点结束()
	--273,110
	x,y=Base.CallFunc("Base.FindColor","[3617831,8025889,12631325,12631325,6972962,5262628,10263070,12631325,5854500,3617831]")

	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x~=273 or y~=110 then return false end
	--745,442
	x,y=Base.CallFunc("Base.FindColor","[9868054,9868054,9868054,14540246,14540246,14540246,9868054,9868054,14540246,14540246]")

	_,_,x,y=string.find(x, "^(-?%d+),(-?%d+)$")
	x=tonumber(x)
	y=tonumber(y)
	if x~=745 or y~=442 then return false end
    return true
end

--++++++++++++++++
local function 选择阵型(fm)
Base.Sleep(2000)
if fm==1 then
	tc(448,187)
elseif fm==2 then  
	tc(576,183)
elseif fm==3 then
	tc(710,181)
elseif fm==4 then 
	tc(516,343)
elseif fm==5 then         --单横
	tc(646,347)
end

end

local function 夜战离脱判定(nt)         --nt==true 追击
Base.Sleep(1000)
if nt==true then
tc(513,243)
Win.Print("进入夜战")
else
tc(290,241)
Win.Print("脱离")
end

end
local function 进击撤退判定(gn)           --gn==true 进击
Base.Sleep(1000)
if gn==true then
tc(290,241)                -- 进击
Win.Print("进击")
else
tc(502,239)                -- 撤退
Win.Print("撤退")
end

end

function 罗盘处理()

	while true do
		if 罗盘() == true then 
		Base.Sleep(2000) 
		Base.ClickRectEx(421,209,10,10)
		Win.Print("罗盘处理中")
		break
		end
		Base.Sleep(100)
	end
end

function D战斗(Formation,Night,GoNextBattle) --阵型，夜战，进击 返回-2提前结束
有掉落=0
local HeavilyDamaged=false
while true do
	if 进入战斗() then break end
	if 罗盘() then 罗盘处理() end
	if 阵型() then 选择阵型(Formation) break end
	if 资源点结束() then 
		Win.Print("D战斗:资源点结束")
		Base.Sleep(3000) 
		tc(651,398)
		return 0
	end
	if 检查是否在母港() then
		通用.等待母港(2000)
		Win.Print("D战斗:结束，回到母港")
		return false
	end
	Base.Sleep(100)
end

Win.Print("D战斗:进入战斗")
Base.Move(10,10)
Base.Sleep(1000*10)
while true do
	if 在夜战离脱判定() then
		Base.Sleep(2000)
		夜战离脱判定(Night)
		Base.Sleep(5000)
	end
	if 胜利失败() then
		Base.Sleep(5000)
		tc(744,430)
		break
	end
	Base.Sleep(200)
end

while true do
	if 战果报告() then
		Win.Print("D战斗:在战果报告")
		Base.Sleep(1000)
		for ix=0,100 do --用5秒找大破
			if HeavilyDamaged==false and 存在大破() then 
				HeavilyDamaged=true
			end
			Base.Sleep(50)
		end
		if HeavilyDamaged then Win.Print("D战斗:有舰船大破") end
		Base.ClickRectEx(553,375)
		Base.Sleep(400)
		break
	end
	Base.Sleep(500)
end

while true do 
	if 掉落() then 
		有掉落=1
		Win.Print("D战斗:有掉落")
		Base.Sleep(5879)
		Base.ClickRectEx(500,387,100,100)
		Base.Sleep(1000)
	end
	if 旗舰大破() then
		Win.Pop("D战斗:旗舰大破",true)
		Base.Sleep(2000)
		Base.ClickRectEx(700,396,60,60)
		Base.Sleep(1000)
	end
	if 在进击撤退判定() then
		Base.Sleep(500)
		if HeavilyDamaged then 
			进击撤退判定(false)
		else 
			进击撤退判定(GoNextBattle) 
		end
		Base.Sleep(1000)
		break
	end
	if 检查是否在母港() then
		通用.等待母港(2000)
		Win.Print("D战斗:结束，回到母港")
		return 1
	end
	Base.Sleep(100)
end
return not HeavilyDamaged
end


function D战斗_强行进击(Formation,Night) --阵型，夜战，进击 返回-2提前结束
有掉落=0
local HeavilyDamaged=false
while true do
	if 进入战斗() then break end
	if 罗盘() then 罗盘处理() end
	if 阵型() then 选择阵型(Formation) break end
	if 资源点结束() then 
		Win.Print("D战斗:资源点结束")
		Base.Sleep(3000) 
		tc(651,398)
		return 0
	end
	if 检查是否在母港() then
		通用.等待母港(2000)
		Win.Print("D战斗:结束，回到母港")
		return false
	end
	Base.Sleep(100)
end

Win.Print("D战斗:进入战斗")
Base.Sleep(1000*10)
Base.Move(10,10)
while true do
	if 在夜战离脱判定() then
		Base.Sleep(2000)
		夜战离脱判定(Night)
		Base.Sleep(5000)
	end
	if 胜利失败() then
		Base.Sleep(5000)
		Base.ClickRect(744,430,5)
		Base.Move(10,10)
		break
	end
	Base.Sleep(200)
end

while true do
	if 战果报告() then
		Win.Print("D战斗:在战果报告")
		Base.Sleep(1000)
		for ix=0,100 do --用5秒找大破
			if HeavilyDamaged==false and 存在大破() then 
				HeavilyDamaged=true
			end
			Base.Sleep(50)
		end
		if HeavilyDamaged then Win.Print("D战斗:有舰船大破") end
		Base.ClickRectEx(553,375)
		Base.Sleep(400)
		break
	end
	Base.Sleep(500)
end

while true do 
	if 掉落() then 
		有掉落=1
		Win.Print("D战斗:有掉落")
		Base.Sleep(5879)
		Base.ClickRectEx(500,387,100,100)
		Base.Move(10,10)
		Base.Sleep(1000)
	end
	if 旗舰大破() then
		Win.Pop("D战斗:旗舰大破",true)
		Base.Sleep(2000)
		Base.ClickRectEx(700,396,60,60)
		Base.Sleep(1000)
	end
	if 在进击撤退判定() then
		Base.Sleep(500)                --改动处
--		if HeavilyDamaged then 
--			进击撤退判定(false)
--		else 
--			进击撤退判定(GoNextBattle) 
--		end
		Win.Print("D战斗:进击")
		进击撤退判定(true)
		Base.Sleep(1000)
		break
	end
	if 检查是否在母港() then
		通用.等待母港(2000)
		Win.Print("D战斗:结束，回到母港")
		return 1
	end
	Base.Sleep(100)
end
return not HeavilyDamaged
end







--[[
function 线路判断(lastp)
	while true do
		if  and lastp~=1 then return 1 end
		if 罗盘() then 罗盘处理() end
		Base.Sleep(100)
	end
end

--仅需对特殊点(如BOSS)做处理时，对能与该点在同一状态下被选择的点集合作强判断
--即用iscolor类型的

function 战斗南西()
if 可以出击()==false then --不能出击，返回-1
	Win.Pop("不能出击！",true)
	--return -1
end
Base.Sleep(3500)
Win.Print("出击2-3！")
Base.ClickRectEx(626,448,25,20)

罗盘处理()
Go_On=true
point=0
mstr="START"
while Go_On do --我还可以打
	point=线路判断(point)
	if     point==1 then --B
		mstr=mstr.."-B"
		Win.Print(mstr)
	elseif point==2 then --C
		mstr=mstr.."-C"
		Win.Print(mstr)
	end
	Base.Sleep(100)
end

Win.Print("出击：异常")
return false

end
]]



