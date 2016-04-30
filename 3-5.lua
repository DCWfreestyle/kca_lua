require("\\Lua\\AdvancedBattle")
function c35()
Base.SetConfig("LastBattleCount", 0)

Kan.Sally(3,5)
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,1,false,false)
Kan.AddBattleInfo(3,1,true,false)
Kan.BattleEx(1,3,99,99,flase)

LastBattleCount = Base.GetValue("LastBattleCount") 
if tonumber(LastBattleCount) == map_battle_count35 then
	rest=rest-1
end

end

local rest = 4

map_battle_count35=3


出击and远征({出击战斗f=c35 ,等待时间=6,结束f=function() return rest==0 end })

