require("\\Lua\\Battle")
include_���� = true
require("\\Lua\\����")
require("\\Lua\\ztaskVer2")
require("\\Lua\\��װ��")
include_�޴�=true
require("\\Lua\\��ʯ�޴�") --require("\\Lua\\changebynew")
require("\\Lua\\����Զ��")


				--���ʣ�ബλ�������droplimit
--Զ��
k2_conquest = C.�L���x��������_ID2 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k3_conquest = C.�����������_ID6 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k4_conquest = C.�����o�l�΄�_ID5 --ָ��Զ�����ɲ鿴Զ��Ҫ��
--ˢ������
kanlist = {
	74,77,88,100,109,112,95,111,86,94
	}
tlist =   {}
mg=3           	-- ÿ��ִ�д���
ˢ������=true
rl =1
���֮����� = true
-------------------------------------------

men = 1 ------ 1�������ȣ�0��ʹ��
number_of_tasks = 2 -------��������
task_id = 1		------����ID 0 , ... , number_of_tasks-1
-----------
dropkan = 1 --���е�������
droplimit = 6 --��������
local n=1
local kanlist_iter=iterator(kanlist)
local ended=false --�����ź�

function ս��1_1()
tc(645,223)
if ���Գ���()==false then --���ܳ���������-1
	Win.Pop("ս��1_1�����ܳ�����",true)
	return false
end
Win.Print("ս��1_1������1-1��")
Base.ClickRectEx(626,448,25,20)
i=1
while i<=2 do
�е���=0
if Dս��(1,false,true) == false then return false end
dropkan=dropkan+�е���
p(("ս��1_1��Dropkan:%d"):format(dropkan))
i=i+1
end
return true
end

function ˢ��һֻ��(t)         -----ִ��p��
local ret=0
���ϻرܹ�(1)
for nx=0,t-1 do
	--backhome()
	if ret ==0 then 
		
	else
		Win.Pop('ˢ��:�������ƣ�ֹͣ')
		break
	end
	����.ִ��(1,1) 
    	if ս��1_1() == false then
		--����
			Win.Print('ˢ��:ս���쳣') --�޷��������ߵ��д���
		end
	Base.Sleep(1000)
	if dropkan >= droplimit then
		dropkan=dropkan-�������(((droplimit)*8)/9)
		backhome()
	end
	������()
	�����Ž�()
	if nx~=(t-1) and dropkan>0 then �����Ž�() �Ž����ƴ���() end
	
	backhome()
	ret = ����.ִ��(true) --ֻ��������1
	if ret ==1 or ret == 11 then
		Win.Pop('ˢ��:�������ƣ�',true)
		����.ִ��(1)
		break
	end
end

���»رܹ�()
ta='ˢ��:ˢ��%d��ִ����ϣ�'
Win.Pop(ta:format(t))
end
--------------------------------------------------


function ˢ��()
if ended then return end --������������
local k,v = kanlist_iter()
if v == nil then   --������Ĵ���
	ended = true  --�����ź�
	if ���֮����� then �������(dropkan) end
	backhome()
	if ˢ������==true then
	Kan.Repair(4)
	akashirep()
	end
	return --�˳�
end
--����ˢ��
    p("ˢ����KanNum:",v)
	������()
	Dcg(1,v) 
	�����Ž�()
	�����Ž�()
	�Ž����ƴ���()
	backhome()
	mg=tlist[k] or 3 --���ó���������Ĭ��Ϊ3������tlist����
	ˢ��һֻ��(mg)
end



while true do 
	ˢ��()
	����һ��Զ��()
	Base.Sleep(1000*2)
end
