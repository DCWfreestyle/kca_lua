require("\\Lua\\Battle")
include_解体 = true
require("\\Lua\\解体")
require("\\Lua\\ztaskVer2")
require("\\Lua\\换装备")
include_修船=true
require("\\Lua\\明石修船") --require("\\Lua\\changebynew")
require("\\Lua\\尝试远征")


				--你的剩余船位必须大于droplimit
--远征
--[[
k2_conquest = C.長距離練習航海_ID2 --指向远征名可查看远征要求
k3_conquest = C.防空射撃演習_ID6 --指向远征名可查看远征要求
k4_conquest = C.海上護衛任務_ID5 --指向远征名可查看远征要求
]]--
--刷闪设置
kanlist = {
   	1,6,31,54,109,115,107,64,74,80,86,94
	}
tlist =   {}
mg=3           	-- 每把执行次数
刷闪修理=true
rl =1
完成之后解体 = true
-------------------------------------------

men = 1 ------ 1开启调度，0不使用
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID 0 , ... , number_of_tasks-1
-----------
dropkan = 1 --现有掉落数量
droplimit = 9 --掉落上限
local n=1
local kanlist_iter=iterator(kanlist)
local ended=false --结束信号

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


function 刷闪()
if ended then return end --结束后不再运行
local k,v = kanlist_iter()
if v == nil then   --结束后的处理
	ended = true  --结束信号
	if 完成之后解体 then 破损解体(dropkan) end
	backhome()
	if 刷闪修理==true then
	Kan.Repair(4)
	akashirep()
	end
	return --退出
end
--进行刷闪
    p("刷闪：KanNum:",v)
	进入编成()
	Dcg(1,v) 
	换下僚舰()
	换上僚舰()
	僚舰大破处理()
	backhome()
	mg=tlist[k] or 3 --设置出击次数，默认为3，可在tlist设置
	刷闪一只船(mg)
end



while true do 
	刷闪()
	尝试一次远征()
	Base.Sleep(1000*2)
end
