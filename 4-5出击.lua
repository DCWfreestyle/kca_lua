--require("\\Lua\\changebynew")
--require("\\Lua\\Battle")
--require("\\Lua\\工具")

--C:   477,213,7961087
function c45()
Kan.Sally(4,5)
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,5,false,false)
Kan.AddBattleInfo(3,1,false,false)
Kan.AddBattleInfo(4,1,true,false)
Kan.AddWay(477,213)
Kan.BattleEx(1,4,99,99,true)

end

function c25()
Kan.Sally(2,5)
Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false)
Kan.AddBattleInfo(2,1,false,false)
Kan.AddBattleInfo(3,1,true,false)
Kan.BattleEx(1,3,99,99,false)

end

c45()

补给.执行() 

通用.等待母港(2000)
Base.ClickRectEx(399,460,10,5) --释放