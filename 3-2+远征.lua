require("\\Lua\\changebynew")
require("\\Lua\\����Զ��")

include_�޴�=true
require("\\Lua\\��ʯ�޴�")
Ǳͧλ�� = 4 --�Ƽ�4��λ��


ss={				--Ǳͧ�滻�飬start,end,page
[0]={7,8,2},
{1,3,3},
{2,2,3}
}
ns=#ss+1
sta=0 ----sta=0,1 , ...... , ns-1
--�������
local zd32 =1  --------- 1����3-2 .0����3-3
local ��������=70
local n=1;local ended = false

local rep=1              --�޴�
ssmethod=1
cgen =1
needchange=true

Kan.AddKanChangeName("Ǳˮ����·��", 1, 15,  true, 0, Ǳͧλ��);

--ʹ��cgInGroups()ǰ,���� 
groups={--137 ʯӡ
		{133,135,89,28,7,20 ,21, 22, 36, 40,
	65 ,117,37, 81, 83, 14, 119},   --CA/CAV
		{117,37,23,27}, --cvl
		{124,132,39}  --eugen zara
		}
cgstas={					--[λ��]={��,�������}
		[2]={1,1},
		[3]={1,1},
		--[6]={1,1},
		[5]={1,1},
		[1]={3,1}
		}
--[[
ca:	7��� 20��� 21(lv8)��ӥ 22���
	25ĦҮ 28���� 36�ӹ� 39�� 40���
	65��Ҷ(lv4) 68���� 

cav:
	72���� 73��Ħ 81��Ұ 83��� 14����  129��V
	]]
------------------------------------------------------------------------------------

function ����323( )

if ended then return end
if n>�������� then
	ended=true
	if rep==1 then
	ȫ������()
	end
	����.ִ��(true)
	return
end

Win.Print(("��ʼ��:%d��"):format(n))


ret =  Kan.Supply() --ֻ��������1

if ret > 0 then
	if ret == Ǳͧλ�� then
		if ssmethod==0 then
			for pn=1,ns do
			scg=Kan.Change(ret,ss[sta][1],ss[sta][2],ss[sta][3],1)
			sta=(sta+1)%ns
			if scg then break end
			end
			if scg==true then
			Win.Print('�ɹ��滻Ǳͧ')
			����.ִ��(1)
			else
			Win.Pop('û�п��滻��Ǳͧ �ű�ֹͣ��',true)
			return
			end
		else
			Kan.ChangeDIY(2,1,0,3,false)
			����.ִ��(1)
		end
		
	else
		Kan.RepairEx(1,12,12)
	end

elseif ret==-1 or ret==-2 then
        Win.Pop('��������\\Զ���� �ű�ֹͣ��',true)
        ended=true
elseif ret==0 and n~=-1 and needchange==true then 
		cgInGroups() needchange=false
elseif ret==0 then
		if zd32==1 then
			����.ִ��(3, 2) --Ŀ�� 3-2
		else
			����.ִ��(3, 3)
		end
		if ս��.ִ��(1, 1, false, 2) == false then
		Win.Print('�����޷���������д���')
		end
		ͨ��.�ȴ�ĸ��(2000)
		n=n+1
		needchange=true
end

end

while true do 
	����323( )
	����һ��Զ��()
	Base.Sleep(1000*2)
end