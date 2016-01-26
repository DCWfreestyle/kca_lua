
require("\\Lua\\ztaskVer2")
--你只需要设置这三行数据即可
k2_conquest = C.長距離練習航海_ID2 --指向远征名可查看远征要求
k3_conquest = C.防空射撃演習_ID6 --指向远征名可查看远征要求
k4_conquest = C.海上護衛任務_ID5 --指向远征名可查看远征要求

check_time = {5,10}
--设置3-5分钟收回并放出一次远征

------------------------------
run_count = 0

--多任务相关
men =0 ------开启调度
number_of_tasks = 2 -------任务数量
task_id = 0		------任务ID，从0开始

while true do
	run_count = run_count + 1
	Win.Print("开始第"..run_count.."次")

	开始占用() ------###########################################
	ret = Kan.ConquestGet()
	--全部收回 会自动进入一次出击并返回母港来刷新出击状态
	Base.Sleep(2000)
	a,b,c,d = Kan.SupplyAll() --执行1234舰队的补给

	Win.Print("补给完毕 尝试远征")

	--判断队伍不在远征状态并且补给成功
	if b ~= C.SUPPLY_STATE_CONQUEST and b ~= -1 and k2_conquest ~= nil then 
		Kan.Conquest(2,k2_conquest[1],k2_conquest[2])
	end

	if c ~= C.SUPPLY_STATE_CONQUEST and c ~= -1 and k3_conquest ~= nil then
		Kan.Conquest(3,k3_conquest[1],k3_conquest[2])
	end

	if d ~= C.SUPPLY_STATE_CONQUEST and d ~= -1 and k4_conquest ~= nil then
		Kan.Conquest(4,k4_conquest[1],k4_conquest[2])
	end

	Win.Print("尝试远征完毕")

	Kan.WaitHomeEx(2000,1000 * 120) --单次周期时间/超时时间

	math.randomseed(os.time())
	min = math.random(check_time[1],check_time[2]) --取随机分钟数3-5

	Win.Print("等待"..min.."分钟")
	
	结束占用() ---###############################
	Base.Sleep(1000*60*min) --等待

end

Win.Pop('脚本执行完毕！')