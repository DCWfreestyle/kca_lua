require("\\Lua\\BaseFunc")
jt=13 -----解体数量 一页10个
from=1
---------------------------------------
-- 调用此脚本前定义 include_解体 = true
dl=31


--------------------
function 工厂完成()
count = {}
table.insert(count,0,{[0]=204,456,1872047}) 
table.insert(count,0,{[0]=24,360,4216780}) 
return IsColorAll(count)
end
--------------------
function 前往工厂解体()
if 工厂完成() == false then
	GoFactory()
	Base.Click(201,252)
	Base.Sleep(750)
end
end
----------------------
function 检查解体是否按new排序()
	array = {}
	count = {}
	
array = {[0]=566,112,15922943}
count[0] = array
array = {[0]=22,381,1673435}
count[1] = array
array = {[0]=580,108,8224573}
count[2] = array
array = {[0]=586,109,15922943}
count[3] = array
array = {[0]=591,113,11382379}
count[4] = array
array = {[0]=584,113,9474092}
count[5] = array
array = {[0]=601,107,15922943}
count[6] = array

	return IsColorAll(count)

end
function 检查解体是否按破损排序()
local s=Base.CallFunc("Base.FindColor","[9868580,8684586,11973994,16645628,16777215,16645627,12631933,9145135,9539626,11118669]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=583 or y~=110 then return false end
    return true
end
----------------------
function 调整解体为按new排序()
while 检查解体是否按new排序() == false do
	Base.ClickRect(589,111)
	Base.Sleep(400)
end
end
function 调整解体为按破损排序()
while 检查解体是否按破损排序() == false do
	Base.ClickRect(589,111)
	Base.Sleep(400)
end
end
----------------------
function 解体有锁(p)
	local dy = (p-1)*31
	if p>1 then dy=dy+1 end
	return Base.IsColor(581,133+dy,8119033)
end
----------------------
function 解体完成()

	array = {}
	count = {}
	
array = {[0]=623,157,14543346}
count[0] = array
array = {[0]=697,383,14609139}
count[1] = array

	return IsColorAll(count)

end
----------------------
function 等待解体完成()
Base.Sleep(1000)
while 解体完成()==false do
	Base.Sleep(1000)
end

end
----------------------
function new解体(amount)

amount=amount or 2 -------- 默认2
前往工厂解体()
调整解体为按new排序()
for nx = 0,amount-1 do
	if 解体有锁(from) == true then
		Win.Pop('解体有锁',true)
	break
	end
	Base.ClickRectEx(383,(140+dl*(from-1)),50,10)
	Base.Sleep(200)
	Base.ClickRect(693,428)
	waitsta(702,432,14543346)
	Win.Print(("解体%d"):format(nx+1))
end --FOR

end

function 破损解体(amount) --返回成功数
前往工厂解体()
调整解体为按破损排序()
local success
for nx = 0,amount-1 do
	success = false
	for i=1,10 do
		if not 解体有锁(i) then
			Base.ClickRectEx(383,(140+dl*(i-1)),50,10)
			Base.Sleep(200)
			Base.ClickRect(693,428)
			waitsta(702,432,14543346)
			Win.Print(("解体%d"):format(nx+1))
			success = true
			break 
		end
	end
	if not success then p(("成功解体"):format(nx+1)) return (nx+1) end
end
p(("成功解体"):format(amount))
return amount
end

-----------------
-----------------
if  include_解体 == nil then
new解体(jt)
backhome()
通用.等待母港(2000)
Base.ClickRectEx(399,460,10,5) --释放
end