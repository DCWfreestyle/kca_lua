require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
require("\\Lua\\尝试远征")
require("\\Lua\\changebynew")
require("\\Lua\\工具")
rfe=0
local n=1
local 出击次数=20 

--[[
 146秋月 140初月
 145天津风4 144天津风3 142天津风2
 143矶风 89酒 63鬼怒  137长良 
 138夕云 136野分
 128鹿岛 
 
]]--432 S

groups={
		{146,140},
		{145,13,144,142,136},--天津风
		{143,24,89,63,137},
		{44,57}
		}
cgstas={					--[位置]={组,组内序号}
		[1]={1,1},
		[5]={2,1},
		[3]={3,1},
		[6]={4,1}
		}
local ended=false
function 线路判断(lastp)
-- 正确=1  沟=2
	while true do
		if Base.IsColor(263,357,6349980) or 
		   Base.IsColor(103,239,6613670) then return 1 end
		if Base.IsColor(547,279,6086807) or
		   Base.IsColor(133,122,6776064) then return 2 end
		if 罗盘() then 罗盘处理() Base.Sleep(500)end
		Base.Sleep(100)
	end
end

function 出击51()
if 可以出击()==false then --不能出击，返回-1
	Win.Pop('不能出击！')
	Win.Print('不能出击！')
	return -1
end
Base.Sleep(3300)
tc(628,442)               --第一舰队
Win.Print('第一舰队5-1出击')
Base.Sleep(3000)
if 线路判断(0)==2 then
	return -10 -----路线错误!
end
Win.Print('线路正确')
Base.Sleep(700)
D战斗(5,false,false)
return true
end


function 肝船5_1T()
if ended==true then return end
if n>出击次数 then 
	ended=true
	return
end
Win.Print(("开始第:%d次"):format(n))
开始占用() --########################################
ret = 补给.执行() --只补给舰队1
if ret > 0 then
	入渠.执行(1,true)

elseif ret==-1 then
        Win.Pop('补给不足 脚本停止！',true)
        return
elseif ret==-2 then
        Win.Pop('远征中 脚本停止！',true)
        return
elseif ret==0  and needchange==true then 
		cgInGroups() needchange=false
elseif ret==0 then
		出击.执行(5, 1) --目标 3-2
		local k=出击51()
		if k==-10 then 
			刷新游戏()
			n=n-1
		end
		通用.等待母港(1500)
		needchange=true
		n=n+1
end


end
--肝船5_1()
--if rfe==1 then Release() end
cgInGroupsAhead()
-- cgInGroups()
while true do 
	肝船5_1T()
	尝试一次远征()
	Base.Sleep(1000*2)
end