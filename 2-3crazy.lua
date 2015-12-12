include_formedcag=true
require("\\Lua\\formedcga")
require("\\Lua\\ztaskVer2")
nanxiexecute=1
require("\\Lua\\南西日常")
include_修船=true
require("\\Lua\\明石修船")
--Base.Sleep(1000*60*12.5)
ssta=0
出击次数=1
出击模式= 1        --1偷油 2任务   3南西
rep=1              --修船
   ------
men = 0 ------开启调度
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID

nnn=1 ret=0 nss=#ss2+1
function 偷油()
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.BattleEx(1, 3)
end
function 任务()
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,1,true,false)
Kan.AddBattleInfo(3,1,true,false)
Kan.BattleEx(1, 3)
end
function 南西()
战斗南西()
end
crazy23={
function() return 偷油() end,
function() return 任务() end,
function() return 南西() end
}
p=0
while nnn<=出击次数 and p<80 do --循环10000次
Win.Print(("开始第:%d次"):format(nnn))
开始占用() --########################################
ret = 补给.执行(true)
while ret~=0 do
	Win.Pop('潜艇大破或中破！',true)
	b=true
	Kan.RepairEx(1,12,12)
	ret = 补给.执行(true)
end
通用.等待母港(1000)
ss2[ssta]()--换船
ssta=(ssta+1)%nss

ret = 补给.执行(true)

if ret==0 then
Win.Print(("现在的ssta:%d"):format((ssta-1)%nss))
通用.等待母港(2000)
Kan.Sally(2,3)
crazy23[出击模式]()
b=false
nnn=nnn+1
end
通用.等待母港(2000)
p=p+1

结束占用()--###########################
end
if not b then 开始占用() end
补给.执行(true)
if rep==1 then
全部修理()
end
结束占用()--########################### 用于Break跳出处理