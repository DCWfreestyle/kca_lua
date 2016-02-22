--2016冬活 E2
--请先把不需要上场的船都修了

--上路M点捞船脚本（秋月天津风什么的） + 远征


--我这里使用的是3DD+3雷巡 100%上路M 
--霞改2 poi 三雷巡 照月
--请带个对空CI 增加通过率 可带1-2个水听保证第一个点S胜 
--雷巡建议带黄炮+甲标+大电探 DD都带绿炮
--默认修小破以上的船 擦伤不休

--大约打一次用1个桶
---------------------------------------------------------------------------------
--这里是设置区域

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

count = 40
--执行次数

---------------------------------------------------------------------------------
--下面的设置修改为别的活动图的时候才需要改

team_id = 1
--出击的队伍ID,联合舰队的话，请写12

use_way = true
--是否使用能动点 地图如果不需要使用能动点 就写false

map_id = 3
--出击地图E1，可自行改为其他图捞船

map_battle_count = 4
--在地图中进行几个点的战斗 超过也可以 但是不能少 少了到Boss前就撤退了 
--(不包括资源点和能动点还有漩涡等不战斗的点的数量)
---------------------------------------------------------------------------------

function SupplyAllStringMatch(_str)
    local t2 = { string.match(_str , "^(-?%d+),(-?%d+),(-?%d+),(-?%d+)|(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)") }
    --将返回的数据匹配到表中
    t = {}

    for key, value in pairs(t2) do  
        table.insert(t,tonumber(value))
    end  --转为数值
    Base.Print(string.format("舰队状态:%d %d %d %d",t[1],t[2],t[3],t[4]))
    Base.Print(string.format("第一舰队单船状态:%d %d %d %d %d %d",t[5],t[6],t[7],t[8],t[9],t[10]))
    
    return t
end

function cj()
    a = "开始第:%d次"
    Win.Print(a:format(n))

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
        
        --修理大中小破的船 6次 除潜艇外的船都使用桶！！
        --如想损坏程度[不到小破]不修理，就把第三参数的+1去掉
        Kan.RepairEx(6, 16, 2 + 4 + 8 )

    elseif t[1] == -1 then
        Win.Pop('补给不足 脚本停止！',true)
        break
    end

    Kan.Sally(10, map_id) --出击E4


    --第一舰队\战斗4次\使用能动点
    if Kan.BattleEx(team_id, map_battle_count , use_way) == false then
        LastBattleCount = Base.GetValue("LastBattleCount")
        Win.Print(LastBattleCount)    
        
        if LastBattleCount ~= nil then
            min = (7 - tonumber(LastBattleCount)) * 3
            Win.Print('战斗结束..等待'..min ..'分钟恢复疲劳再打...')
            Base.Sleep(1000 * 60 *  min) --等待时间
        else
            Win.Print('战斗结束..等待24分钟恢复疲劳再打...')
            Base.Sleep(1000 * 60 *  24) --等待时间
        end
    else
		boss_lv = Base.GetValueInt("Battle_Lv_5") --取第5场胜利等级 6=ss 
		if boss_lv < C.WIN_S and boss_lv > C.WIN_ERROR then 
			time_min = (6 + (5 - boss_lv) * 3)
		    Win.Print('[未S胜]战斗正常结束..等待' .. time_min .. '分钟恢复疲劳再打...')
        	Base.Sleep(1000 * 60 * time_min) --等待时间
		else
		    Win.Print('战斗正常结束..等待12分钟恢复疲劳再打...')
        	Base.Sleep(1000 * 60 * 12) --等待时间
		end

    end

    Kan.WaitHome(2000)
    Base.Sleep(2000)
	YuanZheng()
end



while true do
	Win.Print('进入远征循环等待1分')
    Base.Sleep(60*1000)
	YuanZheng()
end

Win.Pop('脚本执行完毕！')