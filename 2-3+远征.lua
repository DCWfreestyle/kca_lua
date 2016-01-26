include_formedcag=true
require("\\Lua\\formedcga")
require("\\Lua\\ztaskVer2")
nanxiexecute=1
require("\\Lua\\南西日常")
include_修船=true
require("\\Lua\\明石修船")
require("\\Lua\\尝试远征")
local ssta=1
出击次数=5
出击模式= 2        --1偷油 2任务   3南西
local rep=1              --修船
   --远征
k2_conquest = C.長距離練習航海_ID2
k3_conquest = C.防空射撃演習_ID6
k4_conquest = C.海上護衛任務_ID5
men = 0 ------开启调度
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID

local n=1; local ret=0; local nss=#ss2+1; local ended = false;
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
function 疯狂2_3()
if ended then return end
if n>出击次数 then 
	ended=true
	if rep==1 then
	全部修理()
	end
	补给.执行(true)
	return
end
Win.Print(("开始第:%d次"):format(n))
ret = 补给.执行(true)
while ret~=0 do
	Win.Pop('潜艇大破或中破！',true)
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
	n=n+1
end
通用.等待母港(2000)
end
while true do 
	疯狂2_3()
	尝试一次远征()
	Base.Sleep(1000*2)
end


