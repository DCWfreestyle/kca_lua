include_formedcag=true
require("\\Lua\\formedcga")
require("\\Lua\\ztaskVer2")
nanxiexecute=1
require("\\Lua\\�����ճ�")
include_�޴�=true
require("\\Lua\\��ʯ�޴�")
--Base.Sleep(1000*60*12.5)
ssta=0
��������=1
����ģʽ= 1        --1͵�� 2����   3����
rep=1              --�޴�
   ------
men = 0 ------��������
number_of_tasks = 2 -------��������
task_id = 1		------����ID

nnn=1 ret=0 nss=#ss2+1
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
while nnn<=�������� and p<80 do --ѭ��10000��
Win.Print(("��ʼ��:%d��"):format(nnn))
��ʼռ��() --########################################
ret = ����.ִ��(true)
while ret~=0 do
	Win.Pop('Ǳͧ���ƻ����ƣ�',true)
	b=true
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
b=false
nnn=nnn+1
end
ͨ��.�ȴ�ĸ��(2000)
p=p+1

����ռ��()--###########################
end
if not b then ��ʼռ��() end
����.ִ��(true)
if rep==1 then
ȫ������()
end
����ռ��()--########################### ����Break��������