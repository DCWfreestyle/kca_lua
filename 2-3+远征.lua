include_formedcag=true
require("\\Lua\\formedcga")
require("\\Lua\\ztaskVer2")
nanxiexecute=1
require("\\Lua\\�����ճ�")
include_�޴�=true
require("\\Lua\\��ʯ�޴�")
require("\\Lua\\����Զ��")
local ssta=1
��������=5
����ģʽ= 2        --1͵�� 2����   3����
local rep=1              --�޴�
   --Զ��
k2_conquest = C.�L���x��������_ID2
k3_conquest = C.�����������_ID6
k4_conquest = C.�����o�l�΄�_ID5
men = 0 ------��������
number_of_tasks = 2 -------��������
task_id = 1		------����ID

local n=1; local ret=0; local nss=#ss2+1; local ended = false;
function ͵��()
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.BattleEx(1, 3)
end
function ����()
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,1,true,false)
Kan.AddBattleInfo(3,1,true,false)
Kan.BattleEx(1, 3)
end
function ����()
ս������()
end
crazy23={
function() return ͵��() end,
function() return ����() end,
function() return ����() end
}
p=0
function ���2_3()
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
ret = ����.ִ��(true)
while ret~=0 do
	Win.Pop('Ǳͧ���ƻ����ƣ�',true)
	Kan.RepairEx(1,12,12)
	ret = ����.ִ��(true)
end

ͨ��.�ȴ�ĸ��(1000)
ss2[ssta]()--����
ssta=(ssta+1)%nss
ret = ����.ִ��(true)
if ret==0 then
	Win.Print(("���ڵ�ssta:%d"):format((ssta-1)%nss))
	ͨ��.�ȴ�ĸ��(2000)
	Kan.Sally(2,3)
	crazy23[����ģʽ]()
	n=n+1
end
ͨ��.�ȴ�ĸ��(2000)
end
while true do 
	���2_3()
	����һ��Զ��()
	Base.Sleep(1000*2)
end


