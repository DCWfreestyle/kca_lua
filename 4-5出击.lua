

require("\\Lua\\AdvancedBattle")
local rest = 5

map_battle_count45=4

function c45()

Base.SetConfig("LastBattleCount", 0)

Kan.Sally(4,5)
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,5,false,false)
Kan.AddBattleInfo(3,1,false,false)
Kan.AddBattleInfo(4,1,true,false)
Kan.AddWay(477,213)
Kan.BattleEx(1,4,99,99,true)

LastBattleCount = Base.GetValue("LastBattleCount") 
if tonumber(LastBattleCount) < map_battle_count45 then
	rest=rest-1
end

end

出击and远征({出击战斗f=c45 ,等待时间=6,结束f=function() return rest==0 end })