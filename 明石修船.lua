require("\\Lua\\changebynew")
��ʯ��������=3
��ʯ���=99

rl=1
--����֮ǰ���� include_�޴�=true

checked = 0
reppos = 2
function ���޸�ͼ��_��()
local count = {}
table.insert(count,0,{[0]=747,180,12434732}) 
table.insert(count,0,{[0]=738,181,3355443}) 
return IsColorAll(count)
end

function ���޸�ͼ��()
local count = {}
table.insert(count,0,{[0]=765,183,10855470}) 
table.insert(count,{[0]=756,184,8158256}) 
table.insert(count,{[0]=761,166,16382717})
if ���޸�ͼ��_��() then return true end
return IsColorAll(count)
end


function �������()
waitsta(34,146,3991279)
������(reppos)
����Ϊ��������()
tc(FExs[1],pagey) --������ҳ
˳��ѡ��(checked+1)
checked=checked+1
waitsta(611,415,6646383) Base.Sleep(700)
if (not Base.IsColor(678,452,7171615)) or ���޸�ͼ��() then
	tc(162,301) tc(162,301)
	waitsta(410,215,5870139)
	return false
end
Base.ClickRect(686,446)
waitsta(782,112,7105552)
Win.Print("�����һ��")
reppos=reppos+1
return true
end

function akashirep()
GoOrganize()
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----���潢���
	Base.Sleep(1000)
end
Dcg(1,��ʯ���)
while reppos<(��ʯ��������+2) and reppos<6 do
�������()
end
backhome()
end

function ȫ������()
Kan.Repair(4)
akashirep()
end

if not include_�޴� then
 akashirep() 
 if rl==1 then
	ͨ��.�ȴ�ĸ��(2000)
	Base.ClickRectEx(399,460,10,5) --�ͷ�
end
 end