require("\\Lua\\changebynew")
--Base.SetConfig("Sleep+?",200)
require("\\Lua\\ztaskVer2")
Ǳͧλ�� = 4 --�Ƽ�4��λ��
ss={				--Ǳͧ�滻�飬start,end,page
[0]={2,3,3},
{1,8,2},
{2,3,3}
}
ns=#ss+1
sta=0 ----sta=0,1 , ...... , ns-1
--�������
zd32 =1  --------- 1����3-2 .0����3-3
maxrt=200
--���������
men = 1 ------��������
number_of_tasks = 2 -------��������
task_id = 1		------����ID
--------------���������
cgen =1

--ʹ��cgInGroups()ǰ,���� 
groups={
		{68,129,7,81,83,14,25,22,21,40,39,36,20,28,65,72,73},   --CA/CAV
		{124,37,23,27}, --cvl
		}
cgstas={					--[λ��]={��,�������}
		[2]={1,1},
		[3]={1,1},
		[6]={1,1},
		[5]={2,1}
		}
--[[
ca:	7��� 20��� 21(lv8)��ӥ 22���
	25ĦҮ 28���� 36�ӹ� 39�� 40���
	65��Ҷ(lv4) 68���� 

cav:
	72���� 73��Ħ 81��Ұ 83��� 14����  129��V
	]]
------------------------------------------------------------------------------------
for n=0,maxrt do --ѭ��10000��
local a = "��ʼ��:%d��"
Win.Print(a:format(n))
��ʼռ��() --########################################
ret = ����.ִ��() --ֻ��������1
if ret > 0 then
	if ret == Ǳͧλ�� then
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
			break
		end
		
	else
		Win.Pop('��Ǳͧ����Ĵ����ƣ��ű�ֹͣ��',true)
		break
	end

elseif ret==-1 then
        Win.Pop('�������� �ű�ֹͣ��',true)
        break
elseif ret==-2 then
        Win.Pop('Զ���� �ű�ֹͣ��',true)
        break
elseif ret==0 and n~=0 and needchange==true then 
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
		needchange=true
end
����ռ��()--###########################

end
����ռ��()--########################### ����Break��������
