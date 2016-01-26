--[[
men = 1 ------ 1开启调度，0不使用
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID 0 , ... , number_of_tasks-1
]]
require("\\Lua\\BaseFunc")
--================
function 空闲状态()
    array = {};count = {};
    array = {[0]=380,314,16777215}; count[0] = array;
    array = {[0]=380,308,13486666}; count[1] = array;
    array = {[0]=374,307,13486666}; count[2] = array;
    array = {[0]=376,311,16777215}; count[3] = array;
	array = {[0]=196,237,2137083}; count[4] = array;
    return IsColorAll(count)
end

function 结束占用()
if men ~=1 then return false end
通用.等待母港(2000)
Win.Print("结束占用")
Base.ClickRectEx(399,460,10,5)
Base.Sleep(1000*(number_of_tasks*2+0.5)) --最少等待时间（实际还需再加2*DT）
return true
end

function 开始占用()

if men ~=1 then return false end
Win.Print("申请使用权")
while true do
	while 空闲状态() == false do Base.Sleep(1000) end
	---------------=========
	ScheduleT=os.time()
	if ScheduleT%2==0 then  ----可调度
		ScheduleT=ScheduleT/2  --------该任务的调度点
		if task_id == ScheduleT%number_of_tasks then break end
	end
	--===================
	Base.Sleep(1000)
end
Base.ClickRectEx(401,310,10,5) --成功占用
Win.Print("申请使用权成功")
return true
end

function Release()
通用.等待母港(2000)
Win.Print("结束占用")
Base.ClickRectEx(399,460,10,5)
end

