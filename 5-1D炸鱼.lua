require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
require("\\Lua\\����Զ��")
require("\\Lua\\changebynew")
require("\\Lua\\����")
rfe=0
local n=1
local ��������=20 

--[[
 146���� 140����
 145����4 144����3 142����2
 143�� 89�� 63��ŭ  137���� 
 138Ϧ�� 136Ұ��
 128¹�� 
 
]]--432 S

groups={
		{146,140},
		{145,13,144,142,136},--����
		{143,24,89,63,137},
		{44,57}
		}
cgstas={					--[λ��]={��,�������}
		[1]={1,1},
		[5]={2,1},
		[3]={3,1},
		[6]={4,1}
		}
local ended=false
function ��·�ж�(lastp)
-- ��ȷ=1  ��=2
	while true do
		if Base.IsColor(263,357,6349980) or 
		   Base.IsColor(103,239,6613670) then return 1 end
		if Base.IsColor(547,279,6086807) or
		   Base.IsColor(133,122,6776064) then return 2 end
		if ����() then ���̴���() Base.Sleep(500)end
		Base.Sleep(100)
	end
end

function ����51()
if ���Գ���()==false then --���ܳ���������-1
	Win.Pop('���ܳ�����')
	Win.Print('���ܳ�����')
	return -1
end
Base.Sleep(3300)
tc(628,442)               --��һ����
Win.Print('��һ����5-1����')
Base.Sleep(3000)
if ��·�ж�(0)==2 then
	return -10 -----·�ߴ���!
end
Win.Print('��·��ȷ')
Base.Sleep(700)
Dս��(5,false,false)
return true
end


function �δ�5_1T()
if ended==true then return end
if n>�������� then 
	ended=true
	return
end
Win.Print(("��ʼ��:%d��"):format(n))
��ʼռ��() --########################################
ret = ����.ִ��() --ֻ��������1
if ret > 0 then
	����.ִ��(1,true)

elseif ret==-1 then
        Win.Pop('�������� �ű�ֹͣ��',true)
        return
elseif ret==-2 then
        Win.Pop('Զ���� �ű�ֹͣ��',true)
        return
elseif ret==0  and needchange==true then 
		cgInGroups() needchange=false
elseif ret==0 then
		����.ִ��(5, 1) --Ŀ�� 3-2
		local k=����51()
		if k==-10 then 
			ˢ����Ϸ()
			n=n-1
		end
		ͨ��.�ȴ�ĸ��(1500)
		needchange=true
		n=n+1
end


end
--�δ�5_1()
--if rfe==1 then Release() end
cgInGroupsAhead()
-- cgInGroups()
while true do 
	�δ�5_1T()
	����һ��Զ��()
	Base.Sleep(1000*2)
end