require("\\Lua\\changebynew")
--Base.SetConfig("Sleep+?",200)
require("\\Lua\\ztaskVer2")
潜艇位置 = 4 --推荐4号位置
ss={				--潜艇替换组，start,end,page
[0]={2,3,3},
{1,8,2},
{2,3,3}
}
ns=#ss+1
sta=0 ----sta=0,1 , ...... , ns-1
--出击相关
zd32 =1  --------- 1出击3-2 .0出击3-3
maxrt=200
--多任务相关
men = 1 ------开启调度
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID
--------------换打手相关
cgen =1

--使用cgInGroups()前,设置 
groups={
		{68,129,7,81,83,14,25,22,21,40,39,36,20,28,65,72,73},   --CA/CAV
		{124,37,23,27}, --cvl
		}
cgstas={					--[位置]={组,组内序号}
		[2]={1,1},
		[3]={1,1},
		[6]={1,1},
		[5]={2,1}
		}
--[[
ca:	7足柄 20羽黑 21(lv8)古鹰 22妙高
	25摩耶 28衣笠 36加古 39鸟海 40爱宕
	65青叶(lv4) 68那智 

cav:
	72利根 73筑摩 81熊野 83铃谷 14最上  129三V
	]]
------------------------------------------------------------------------------------
for n=0,maxrt do --循环10000次
local a = "开始第:%d次"
Win.Print(a:format(n))
开始占用() --########################################
ret = 补给.执行() --只补给舰队1
if ret > 0 then
	if ret == 潜艇位置 then
		for pn=1,ns do
			scg=Kan.Change(ret,ss[sta][1],ss[sta][2],ss[sta][3],1)
			sta=(sta+1)%ns
			if scg then break end
		end
		if scg==true then
			Win.Print('成功替换潜艇')
			入渠.执行(1)
		else
			Win.Pop('没有可替换的潜艇 脚本停止！',true)
			break
		end
		
	else
		Win.Pop('有潜艇以外的船大破！脚本停止！',true)
		break
	end

elseif ret==-1 then
        Win.Pop('补给不足 脚本停止！',true)
        break
elseif ret==-2 then
        Win.Pop('远征中 脚本停止！',true)
        break
elseif ret==0 and n~=0 and needchange==true then 
		cgInGroups() needchange=false
elseif ret==0 then
		if zd32==1 then
			出击.执行(3, 2) --目标 3-2
		else
			出击.执行(3, 3)
		end
		if 战斗.执行(1, 1, false, 2) == false then
		Win.Print('可能无法出击或道中大破')
		end
		通用.等待母港(2000)
		needchange=true
end
结束占用()--###########################

end
结束占用()--########################### 用于Break跳出处理
