
--Default
if k2_conquest==nil and k3_conquest==nil and k4_conquest==nil then
k2_conquest = C.�����������_ID6
k3_conquest = C.�|�����Џr_ID38
k4_conquest = C.�����΄�_ID3
end
--
local check_time = {3,5}
local yz_last_time = os.time()
local run_count = 0
local yz_delay_time=0
--ִ��
function ����һ��Զ��()
if  os.time()<=yz_last_time+yz_delay_time*60 then return end
run_count = run_count + 1
Win.Print("Զ�����Ե�"..run_count.."��")
--start
ret = Kan.ConquestGet()
Base.Sleep(2000)
a,b,c,d = Kan.SupplyAll() --ִ��1234���ӵĲ���

Win.Print("������� ����Զ��")
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
yz_last_time=os.time()
Kan.WaitHomeEx(2000,1000 * 120) --��������ʱ��/��ʱʱ��
--end()
math.randomseed(os.time())
yz_delay_time = math.random(check_time[1],check_time[2]) --ȡ���������3-5
Win.Print("�ȴ�"..yz_delay_time.."����")
end