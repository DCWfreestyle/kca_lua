--[[
men = 1 ------ 1�������ȣ�0��ʹ��
number_of_tasks = 2 -------��������
task_id = 1		------����ID 0 , ... , number_of_tasks-1
]]
require("\\Lua\\BaseFunc")
--================
powertaken=false     --��¼�Ƿ�ռ��
--
--[[ Export:
����ռ��() ��ʼռ��() Release() ����ex(sleeptime) /��

]]
local function ����״̬()
    array = {};count = {};
    array = {[0]=380,314,16777215}; count[0] = array;
    array = {[0]=380,308,13486666}; count[1] = array;
    array = {[0]=374,307,13486666}; count[2] = array;
    array = {[0]=376,311,16777215}; count[3] = array;
	array = {[0]=196,237,2137083}; count[4] = array;
    return IsColorAll(count)
end

function ����ռ��()
if powertaken==false then return true end
if men ~=1 then return false end
ͨ��.�ȴ�ĸ��(2000)
Base.ClickRectEx(399,460,10,5)
powertaken=false
Win.Print("����ռ��")
Base.Sleep(1000*(number_of_tasks*2+0.5)) --���ٵȴ�ʱ�䣨ʵ�ʻ����ټ�2*DT��
return true
end

function ��ʼռ��()
if powertaken==true then return true end
if men ~=1 then return false end
Win.Print("����ʹ��Ȩ")
local ScheduleT
while true do
	while ����״̬() == false do Base.Sleep(1000) end
	---------------=========
	ScheduleT=os.time()
	if ScheduleT%2==0 then  ----�ɵ���
		ScheduleT=ScheduleT/2  --------������ĵ��ȵ�
		if task_id == ScheduleT%number_of_tasks then break end
	end
	--===================
	Base.Sleep(1000)
end
Base.ClickRectEx(401,310,10,5) --�ɹ�ռ��
Win.Print("����ʹ��Ȩ�ɹ�")
powertaken=true
return true
end

function Release()
ͨ��.�ȴ�ĸ��(2000)
Win.Print("����ռ��")
Base.ClickRectEx(399,460,10,5)
end

function Request() --������ռ��
while ����״̬() == false do Base.Sleep(500) end
Base.ClickRectEx(401,310,10,5) --�ɹ�ռ��
end


function ����ex(sleeptime)  --����ʱ���ͷſ���Ȩ
����ռ��()
Win.Print(("����%d"):format(sleeptime))
Base.Sleep(sleeptime)
��ʼռ��()
Kan.ConquestGet()
end
