require("\\Lua\\Battle")
require("\\Lua\\����Զ��")
include_�޴�=true
require("\\Lua\\��ʯ�޴�")
--i added this 
include_formedcag=true
require("\\Lua\\formedcga")

Kan.Sally(3,5)
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,1,false,false)
Kan.AddBattleInfo(3,1,true,false)
Kan.BattleEx(1,3,99,99,flase)

����.ִ��() 



LastBattleCount = Base.GetValue("LastBattleCount")
p(LastBattleCount)