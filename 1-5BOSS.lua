include_formedcag=true
require("\\Lua\\formedcga")
hc=0
if hc==1 then hcg[3]() end
rl=1
出击.执行(1, 5)
战斗.执行(1, 4, false, 5)
Kan.Supply()

if rl==1 then
通用.等待母港(2000)
Base.ClickRectEx(399,460,10,5) --释放
end
require("\\Lua\\尝试远征")
while true do
	尝试一次远征()
	Base.Sleep(1000*2)
end