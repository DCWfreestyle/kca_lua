

require("\\Lua\\AdvancedBattle")
local rest = 4

map_battle_count25=3
function c25()
Kan.Sally(2,5)
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,1,false,false)
Kan.AddBattleInfo(3,1,true,false)
Kan.BattleEx(1,3,99,99,false)


LastBattleCount = Base.GetValue("LastBattleCount") 
if tonumber(LastBattleCount) < map_battle_count25 then
	rest=rest-1
end

end


����andԶ��({����ս��f=c25 ,�ȴ�ʱ��=8,����f=function() return rest==0 end })
