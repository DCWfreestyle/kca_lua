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
--[[
cl:
	2��ĥ 4���� 5��ͨ 10�ǿ� 12���� 32��ʮ��
	34��ĥ 50����Ұ 52��� 53�ܴ� 62aww 63��ŭ  
	75Ϧ�� 89�Ƅ� 122¹�� 128����
DD:
	64���� 66ѩ�� 131���� 134����
	9�� 13�� 1�� 24�� 
	31ʱ�� 41��ѩ 79��˪ 47���� 
	48�貨 11Ϧ�� 
	15���� 6���� 3��ѩ 54亷� 74���� 77î�� 78���� 79��˪ 86�߲� 55����
	6���¡�33�w�¡�42���� 59�ַ� 69���� 94ʱ��� 95���� 
	54亷�  71���� 113��˪ 61��� 80�ȷ� 88ϼ 100����
	106��˪ 107ɽ��  110���� 111��ѩ 114���� 108z1
    120���� 121���� 126��˪ 127Ұ�� 129Ϧ�� 133��
]]--
--ˢ������ 
kanlist = {
	47,42,33,15,13,6,3,11,61,59
	}
tlist = {}
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
droplimit = 7 --������
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
	if ���֮����� then �������(dropkan-1) end
	backhome()
	if ˢ������==true then
	Kan.Repair(4)
	akashirep()
	end
	return --�˳�
end
--����ˢ��
    p("ˢ����KanNum:",v)
	GoOrganize()
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
