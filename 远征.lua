
require("\\Lua\\ztaskVer2")
--��ֻ��Ҫ�������������ݼ���
k2_conquest = C.�L���x��������_ID2 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k3_conquest = C.�����������_ID6 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k4_conquest = C.�����o�l�΄�_ID5 --ָ��Զ�����ɲ鿴Զ��Ҫ��

check_time = {5,10}
--����3-5�����ջز��ų�һ��Զ��

------------------------------
run_count = 0

--���������
men =0 ------��������
number_of_tasks = 2 -------��������
task_id = 0		------����ID����0��ʼ

while true do
	run_count = run_count + 1
	Win.Print("��ʼ��"..run_count.."��")

	��ʼռ��() ------###########################################
	ret = Kan.ConquestGet()
	--ȫ���ջ� ���Զ�����һ�γ���������ĸ����ˢ�³���״̬
	Base.Sleep(2000)
	a,b,c,d = Kan.SupplyAll() --ִ��1234���ӵĲ���

	Win.Print("������� ����Զ��")

	--�ж϶��鲻��Զ��״̬���Ҳ����ɹ�
	if b ~= C.SUPPLY_STATE_CONQUEST and b ~= -1 and k2_conquest ~= nil then 
		Kan.Conquest(2,k2_conquest[1],k2_conquest[2])
	end

	if c ~= C.SUPPLY_STATE_CONQUEST and c ~= -1 and k3_conquest ~= nil then
		Kan.Conquest(3,k3_conquest[1],k3_conquest[2])
	end

	if d ~= C.SUPPLY_STATE_CONQUEST and d ~= -1 and k4_conquest ~= nil then
		Kan.Conquest(4,k4_conquest[1],k4_conquest[2])
	end

	Win.Print("����Զ�����")

	Kan.WaitHomeEx(2000,1000 * 120) --��������ʱ��/��ʱʱ��

	math.randomseed(os.time())
	min = math.random(check_time[1],check_time[2]) --ȡ���������3-5

	Win.Print("�ȴ�"..min.."����")
	
	����ռ��() ---###############################
	Base.Sleep(1000*60*min) --�ȴ�

end

Win.Pop('�ű�ִ����ϣ�')