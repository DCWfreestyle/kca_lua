--2015 秋活 E4水打下路（丙） 捞 道中4战（2战潜艇）
--会自动修理 等待疲劳 
--建议打丙来捞了 再去打甲（因为掉率都一样）
--打之前不要有其他损坏的船存在，有的话全修好
--由于强度不高，默认不修理【小于小破的船】
--支持进度清零（开始1次，后面每打两次执行一次）！具体请阅读设置！
---------------------------------------------------------------------------------
--这个脚本是针对丙的，如果打乙会导致消不了进度！！！！！ 
--可自行修改函数E4LvChange -> Base.Click(363,267) 改为其他作战坐标
---------------------------------------------------------------------------------
--我这里的配置是 水打
--1队 BSM\雾岛(双炮撤甲飞机) 轻母*2(制空200+) 大淀\夕张(反潜)
--2队 照月(对空CI) 夕立川内(反潜) 三雷巡（最少带一个夜战CI）
---------------------------------------------------------------------------------
--这里是设置区域 请务必仔细阅读！！！

Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false) --对潜
Kan.AddBattleInfo(2,4,false,false) --战斗队形
Kan.AddBattleInfo(3,4,false,false) --复纵队形 
Kan.AddBattleInfo(4,1,false,false) --对潜
Kan.AddBattleInfo(5,1,true,false)  --对潜 夜战
--每个点的战斗设置 如果要修改为别的活动图的时候需要改

Kan.AddWay(427,333,135,200) --F N 点
--能动点设置M！ 坐标用顶部工具箱可以得到

--★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--如果因为没有仔细阅读这里成为咸鱼侠，本人概不负责！
--如果因为没有仔细阅读这里成为咸鱼侠，本人概不负责！
--如果因为没有仔细阅读这里成为咸鱼侠，本人概不负责！
count = 2
--出击次数 打丙的话4次会过掉地图 为了避免成为咸鱼侠 大于3的出击请务必开启lv_change！！

lv_change = false
--这个脚本是针对丙的，如果打乙会导致消不了进度！！！！！
--重要！！！！！ 这个为true则会自动从丙切换到乙再切回丙，消进度，来保证不过掉E4
--如果你已经咸过了E4，那么请把这个设置成false，次数可任意写....
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★

--kan_support_boss_id = 4
--Boss支援舰队ID 不需要的话请在前面加--注释掉 丙E4不需要

    kan_support_id = 3
--道中支援舰队ID 不需要的话请在前面加--注释掉 丙E4不需要

---------------------------------------------------------------------------------
--下面的设置修改为别的活动图的时候才需要改

team_id = 12
--出击的队伍ID,联合舰队的话，请写12

use_way = true
--是否使用能动点 地图如果不需要使用能动点 就写false

map_id = 4
--出击地图E3，可自行改为其他图捞船

map_battle_count = 5
--在地图中进行几个点的战斗 超过也可以 但是不能少 少了到Boss前就撤退了 
--(不包括资源点和能动点还有漩涡等不战斗的点的数量)

--Base.SetConfig("Sleep+?",100) --所有延时随机增加1-100
---------------------------------------------------------------------------------

function SupplyAllStringMatch(_str)
    local t2 = { string.match(_str , "^(-?%d+),(-?%d+),(-?%d+),(-?%d+)|(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)") }
    --将返回的数据匹配到表中
    t = {}

    for key, value in pairs(t2) do  
        table.insert(t,tonumber(value))
    end  --转为数值
    Base.Print(string.format("舰队状态:%d %d %d %d",t[1],t[2],t[3],t[4]))
    Base.Print(string.format("第1舰队单船状态:%d %d %d %d %d %d",t[5],t[6],t[7],t[8],t[9],t[10]))
    Base.Print(string.format("第2舰队单船状态:%d %d %d %d %d %d",t[11],t[12],t[13],t[14],t[15],t[16]))
    return t
end

function NeedRepair(_t) --判断是否需要修理
    if t[5]>0 or t[6]>0 or t[7]>0 or t[8]>0 or t[9]>0 or t[10]>0 then
        return true
    end
    if t[11]>0 or t[12]>0 or t[13]>0 or t[14]>0 or t[15]>0 or t[16]>0 then
        return true
    end
    
    return false
end

function E4LvChange() --判断是否需要修理
	if lv_change == false then
		return false
	end
	
	Win.Print('重置进度...')
	Kan.WaitHome(2000)
	Base.Click(204,247)		
	while Base.IsColor(454,243,4170070) == false and Base.IsColor(196,303,199) == false do
		Base.Sleep(500) --等待出击画面时间
	end
	Base.Click(245,274)
	while Base.IsColor(599,121,5744383) == false do
		Base.Sleep(500) --等待出击画面时间
	end
	Base.Sleep(500) --等待出击画面时间
	Base.Click(709,450) --活动图
	Base.Sleep(2000)
	Base.Click(422,278) --翻页
	Base.Sleep(2000)
	
	if Base.IsColor(757,169,255) == true then
		Win.Print('进度是满的...开始战斗吧少年')
		Base.Click(15,12) --回母港
		Kan.WaitHome(2000)
		return false
	end
	
	Base.Click(649,206) --E4
	while Base.IsColor(476,61,10262315) == false do
		Base.Sleep(500) --等待作战计划变更画面时间
	end
	Base.Sleep(500) 
	Base.Click(520,62) --作战计划
	Base.Sleep(2000) 
	Base.Click(363,267) --先选一个乙作战

	while Base.IsColor(515,296,10460707) == false do
		Base.Sleep(500) --等待计划变更确定
	end
	Base.Sleep(500) 
	Base.Click(508,298) --确定

	while Base.IsColor(716,444,7039266) == false do
		Base.Sleep(500) --等待计划变更确定
	end
	Base.Sleep(500) 
	Base.Click(461,116) --退出作战确定

	while Base.IsColor(600,121,5744895) == false do
		Base.Sleep(500) --等待退出完毕
	end

	Base.Sleep(500)
	Base.Click(649,206) --E4

	while Base.IsColor(476,61,10262315) == false do
		Base.Sleep(500) --等待作战计划变更画面时间
	end
	Base.Sleep(500) 
	Base.Click(520,62) --作战计划
	Base.Sleep(2000) 
	Base.Click(498,235) --丙作战

	while Base.IsColor(515,296,10460707) == false do
		Base.Sleep(500) --等待计划变更确定
	end
	Base.Sleep(500) 
	Base.Click(508,298) --确定

	while Base.IsColor(716,444,7039266) == false do
		Base.Sleep(500) --等待计划变更确定
	end
	Base.Sleep(500) 
	Base.Click(15,12) --回母港
	Kan.WaitHome(2000)
	return true
end


E4LvChange()

for n = 1, count do --循环次数
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
    
    if NeedRepair(t) == true then
        Win.Print('船大/中/小破！使用进入修理')
        
        --修理大中小破的船 6次 除潜艇外的船都使用桶！！
        --如想损坏程度[不到小破]不修理，就把第三参数的+1去掉
        Kan.RepairEx(12, 2 + 4 + 8, 2 + 4 + 8 )
    elseif t[1] == -1 then
        Win.Pop('补给不足 脚本停止！',true)
        break
    end
    
    Kan.Sally(10, map_id) --出击E3
    
	Base.SetConfig("LastBattleCount", 0)
    --第一舰队\战斗4次\使用能动点
    if Kan.BattleEx(team_id, map_battle_count , use_way) == false then
        LastBattleCount = Base.GetValue("LastBattleCount")
        if LastBattleCount ~= nil and LastBattleCount ~= "" then
            if tonumber(LastBattleCount) < map_battle_count then
                Win.Print('道中劝退')
            end
            min = (7 - tonumber(LastBattleCount)) * 1.1 
            Win.Print('战斗正常结束..等待'..min ..'分钟恢复疲劳再打...')
            Base.Sleep(1000 * 60 *  min) --等待时间
        else
			if LastBattleCount == "" or LastBattleCount == "0" then
				Win.Print('出击失败，存在大破船或船位装备已满')
				Win.Pop('出击失败，存在大破船或船位装备已满')
				break
			else
				Win.Print('战斗正常结束..等待24分钟恢复疲劳再打...')
            	Base.Sleep(1000 * 60 *  6) --等待时间
			end
        end 
    else
        LastBattleCount = Base.GetValue("LastBattleCount")
        if LastBattleCount ~= nil and tonumber(LastBattleCount) < map_battle_count then
            Win.Print('第一舰队旗舰大破劝退')
        end
        Win.Print('战斗正常结束..等待3分钟恢复疲劳再打...')
        Base.Sleep(1000 * 60 * 0.5) --等待时间
    end
    Kan.WaitHome(2000)
	
	if n % 2 == 0 then
		--重置进度
		E4LvChange()
	end
	
    Base.Sleep(2000)
end

Win.Pop('脚本执行完毕！')