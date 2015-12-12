require("\\Lua\\changebynew")
require("\\Lua\\Battle")
include_解体 = true
require("\\Lua\\解体")
require("\\Lua\\ztaskVer2")
require("\\Lua\\换装备")
include_修船=true
require("\\Lua\\明石修船")


mode =2        --模式,1 普通 ,2 多个
mg=            -- 每把执行次数
3              --你的剩余船位必须大于droplimit

kanlist = {95}
tlist =   {}
刷闪修理=true
rl =1
-------------------------------------------

men = 1 ------ 1开启调度，0不使用
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID 0 , ... , number_of_tasks-1
-----------
dropkan = 1 --现有掉落数量
droplimit = 6 --掉落上限

function 战斗1_1()
tc(645,223)
if 可以出击()==false then --不能出击，返回-1
	Win.Pop("战斗1_1：不能出击！",true)
	return false
end
Win.Print("战斗1_1：出击1-1！")
Base.ClickRectEx(626,448,25,20)
i=1
while i<=2 do
有掉落=0
if D战斗(1,false,true) == false then return false end
dropkan=dropkan+有掉落
p(("战斗1_1：Dropkan:%d"):format(dropkan))
i=i+1
end
return true
end

function 刷闪一只船(t)         -----执行p次
local ret=0
换上回避锅(1)
for nx=0,t-1 do
	--backhome()
	if ret ==0 then 
		
	else
		Win.Pop('刷闪:舰船大破！停止')
		break
	end
	出击.执行(1,1) 
    	if 战斗1_1() == false then
		--出错
			Win.Print('刷闪:战斗异常') --无法出击或者道中大破
		end
	Base.Sleep(1000)
	if dropkan >= droplimit then
		dropkan=dropkan-破损解体(((droplimit)*8)/9)
		backhome()
	end
	进入编成()
	换下僚舰()
	if nx~=(t-1) and dropkan>0 then 换上僚舰() 僚舰大破处理() end
	
	backhome()
	ret = 补给.执行(true) --只补给舰队1
	if ret ==1 or ret == 11 then
		Win.Pop('刷闪:舰船大破！',true)
		入渠.执行(1)
		break
	end
end

换下回避锅()
ta='刷闪:刷闪%d次执行完毕！'
Win.Pop(ta:format(t))
end
--------------------------------------------------

	Kan.Sally(1, 1) --进行出击1-5

	--不夜战/阵型单纵
	if Kan.Battle(1, 2, false, 1) == false then
		Base.Print('战斗异常') --无法出击或者道中大破
	end
	


if rl==1 then
backhome()
Base.ClickRectEx(399,460,10,5) --释放
end

