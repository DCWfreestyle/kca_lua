require("\\Lua\\changebynew")
require("\\Lua\\ztaskVer2")
require("\\Lua\\尝试远征")
local ssta=0
出击次数=20
nss=3
n=1
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,5,false,false) --横 对潜
Kan.AddBattleInfo(2,3,false,false) --轮 对空
Kan.AddBattleInfo(3,1,false,false) --纵 打小船
Kan.AddBattleInfo(4,1,true,false) --纵 M点群爹 夜战
--Kan.AddBattleInfo(5,1,true,false)  --纵 夜战 Boss
--2\3为夜战点，可考虑单横（5）来回避CI
--每个点的战斗设置 如果要修改为别的活动图的时候需要改

Kan.AddWay(359,122)
--能动点 上路I点

--kan_support_boss_id = 2
--远征Boss支援舰队ID

--kan_support_id = 3
--远征道中支援舰队ID

count = 80

team_id = 1
--出击的队伍ID,联合舰队的话，请写12

use_way = true
--是否使用能动点 地图如果不需要使用能动点 就写false

map_id = 3
--出击地图E1，可自行改为其他图捞船

map_battle_count = 4
--在地图中进行几个点的战斗 超过也可以 但是不能少 少了到Boss前就撤退了 
--(不包括资源点和能动点还有漩涡等不战斗的点的数量)

function 捞船()
if n>出击次数 then return false end
a = "开始第:%d次"
    Win.Print(a:format(n))
	编成展开(ssta+1)
	ssta=(ssta+1)%nss
    ret = Base.CallFunc("Kan.SupplyAll") --补给全部并返回所有数据
    Base.Print(ret)

    t = SupplyAllStringMatch(ret) --返回的文本转到table

    if kan_support_boss_id ~= nil and t[kan_support_boss_id] ~= -3 then
        Kan.Conquest(kan_support_boss_id,10,2) --出击Boss支援
    end

    if kan_support_id ~= nil and t[kan_support_id] ~= -3 then
        Kan.Conquest(kan_support_id,10,1) --出击道中支援
    end

    if t[5]>0 or t[6]>0 or t[7]>0 or t[8]>0 or t[9]>0 or t[10]>0 then
        Win.Print('船大/中/小破！使用进入修理')
        Kan.RepairEx(6, 16, 2 + 4 + 8 )

    elseif t[1] == -1 then
        Win.Pop('补给不足 脚本停止！',true)
		return
    end

    Kan.Sally(10, map_id) --出击E4


    --第一舰队\战斗4次\使用能动点
    if Kan.BattleEx(team_id, map_battle_count , use_way) == false then
        LastBattleCount = Base.GetValue("LastBattleCount")
        Win.Print(LastBattleCount)    
    end
	n=n+1
    Kan.WaitHome(2000)
end
while true do 
	捞船()
	尝试一次远征()
	Base.Sleep(1000*2)
end


