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
cl:
	2多磨 4天龙 5神通 10那可 12川内 32五十铃
	34球磨 50阿贺野 52大淀 53能代 62aww 63鬼怒  
	75夕张 89酒匂 122鹿岛 128长良
DD:
	64岛风 66雪风 131初月 134秋月
	9晓 13雷 1电 24响 
	31时雨 41吹雪 79初霜 47从云 
	48凌波 11夕立 
	15凉风 6睦月 3白雪 54浜风 74如月 77卯月 78初风 79初霜 86高波 55弥生
	6睦月　33皐月　42望月 59浦风 69卷云 94时津风 95天津风 
	54浜风  71朝潮 113朝霜 61舞风 80谷风 88霞 100满潮
	106清霜 107山云  110初春 111初雪 114江风 108z1
    120秋云 121海风 126早霜 127野分 129夕云 133矶风
]]--
--刷闪设置 
kanlist = {
	47,42,33,15,13,6,3,11,61,59
	}
tlist = {}
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
droplimit = 7 --掉落上
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
	if 完成之后解体 then 破损解体(dropkan-1) end
	backhome()
	if 刷闪修理==true then
	Kan.Repair(4)
	akashirep()
	end
	return --退出
end
--进行刷闪
    p("刷闪：KanNum:",v)
	GoOrganize()
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
