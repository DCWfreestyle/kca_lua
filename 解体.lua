require("\\Lua\\BaseFunc")
jt=13 -----�������� һҳ10��
from=1
---------------------------------------
-- ���ô˽ű�ǰ���� include_���� = true
dl=31


--------------------
function �������()
count = {}
table.insert(count,0,{[0]=204,456,1872047}) 
table.insert(count,0,{[0]=24,360,4216780}) 
return IsColorAll(count)
end
--------------------
function ǰ����������()
if �������() == false then
	GoFactory()
	Base.Click(201,252)
	Base.Sleep(750)
end
end
----------------------
function �������Ƿ�new����()
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
function �������Ƿ���������()
local s=Base.CallFunc("Base.FindColor","[9868580,8684586,11973994,16645628,16777215,16645627,12631933,9145135,9539626,11118669]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=583 or y~=110 then return false end
    return true
end
----------------------
function ��������Ϊ��new����()
while �������Ƿ�new����() == false do
	Base.ClickRect(589,111)
	Base.Sleep(400)
end
end
function ��������Ϊ����������()
while �������Ƿ���������() == false do
	Base.ClickRect(589,111)
	Base.Sleep(400)
end
end
----------------------
function ��������(p)
	local dy = (p-1)*31
	if p>1 then dy=dy+1 end
	return Base.IsColor(581,133+dy,8119033)
end
----------------------
function �������()

	array = {}
	count = {}
	
array = {[0]=623,157,14543346}
count[0] = array
array = {[0]=697,383,14609139}
count[1] = array

	return IsColorAll(count)

end
----------------------
function �ȴ��������()
Base.Sleep(1000)
while �������()==false do
	Base.Sleep(1000)
end

end
----------------------
function new����(amount)

amount=amount or 2 -------- Ĭ��2
ǰ����������()
��������Ϊ��new����()
for nx = 0,amount-1 do
	if ��������(from) == true then
		Win.Pop('��������',true)
	break
	end
	Base.ClickRectEx(383,(140+dl*(from-1)),50,10)
	Base.Sleep(200)
	Base.ClickRect(693,428)
	waitsta(702,432,14543346)
	Win.Print(("����%d"):format(nx+1))
end --FOR

end

function �������(amount) --���سɹ���
ǰ����������()
��������Ϊ����������()
local success
for nx = 0,amount-1 do
	success = false
	for i=1,10 do
		if not ��������(i) then
			Base.ClickRectEx(383,(140+dl*(i-1)),50,10)
			Base.Sleep(200)
			Base.ClickRect(693,428)
			waitsta(702,432,14543346)
			Win.Print(("����%d"):format(nx+1))
			success = true
			break 
		end
	end
	if not success then p(("�ɹ�����"):format(nx+1)) return (nx+1) end
end
p(("�ɹ�����"):format(amount))
return amount
end

-----------------
-----------------
if  include_���� == nil then
new����(jt)
backhome()
ͨ��.�ȴ�ĸ��(2000)
Base.ClickRectEx(399,460,10,5) --�ͷ�
end