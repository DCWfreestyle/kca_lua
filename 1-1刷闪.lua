require("\\Lua\\changebynew")
require("\\Lua\\Battle")
include_���� = true
require("\\Lua\\����")
require("\\Lua\\ztaskVer2")
require("\\Lua\\��װ��")
include_�޴�=true
require("\\Lua\\��ʯ�޴�")


mg=            -- ÿ��ִ�д���
3              --���ʣ�ബλ�������droplimit

kanlist = {
	48}--48,54,59,64,79
tlist =   {}
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

for k,v in pairs(kanlist) do

    p("ˢ����KanNum:",v)
��ʼռ��()--########################################
	������()
	Dcg(1,v)
	�����Ž�()
	�����Ž�()
	�Ž����ƴ���()
	backhome()
	mg=tlist[k] or 3 --��������õĴ����������õ�
	ˢ��һֻ��(mg)
����ռ��()--########################################
end

��ʼռ��()--########################################
if ���֮����� then �������(dropkan) end
backhome()

if ˢ������==true then
Kan.Repair(4)
akashirep()
end

����ռ��()--########################################
end



ˢ��()

if rl==1 then
backhome()
Base.ClickRectEx(399,460,10,5) --�ͷ�
end

