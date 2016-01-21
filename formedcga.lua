require("\\Lua\\changebynew")

--require("\\Lua\\formedcga")
S_changedbynew=true
--调用之前加入 include_formedcag=true
-- cgb(g)  --g={{n1,n2},{n1,n2},...}
--[[				hcg[]()
1：3潜艇 2：3-3北方任务 3：1-5BOSS
4:5潜艇 5：3CL3DD 6：水打南方へ
7:「空母機動部隊」西へ! 8:「第五戦隊」6ca
9:水反 10:2-5 11:1-6 12:4-5
13:4-5斩杀 14:演习BB+5DD 15:演习BB +DD+SS +3CLT
16:3-5_1cl5DD 17:空母机动北方
]]
--[[
ca:	7足柄 20羽黑 21(lv8)古鹰 22妙高
	25摩耶 28衣笠 36加古 39鸟海 40爱宕
	65青叶(lv4) 68那智 

cav:
	72利根 73筑摩 81熊野 83铃谷 14最上 121三V
clt:
	19木曾 45北上 76大井
cl:
	2多磨 4天龙 5神通 10那可 12川内 32五十铃
	34球磨 50阿贺野 52大淀 53能代 62aww 63鬼怒  
	75夕张 89酒匂
SS;	
	46 i166 58吕500 
	103伊58 84伊8  96伊19 
ssv:
	67伊58改 70伊8改 93伊19改 
cv:
	16翔鹤 17赤城 38苍龙 56飞龙 60加贺 82葛城 85瑞鹤 91云龙
	102大凤 104苍龙2号 101加贺2号
clv:
	29隼鹰 23千代田二  37飞鹰 26RJ 27 千岁二 124瑞凤
BB:
	8比睿 30雾岛 49榛名 51金刚
	18陆奥 97长门
	98大和 106武藏 110BSM 113大和2号 注意编号很可能因拆SS变小
	87Littorio 92Roma
BBV:
	35日向 44伊势 57山城 43扶桑
DD:
	64岛风 66雪风 
	9晓 13雷 1电 24响 
	31时雨 41吹雪 79初霜 47从云 
	48凌波 11夕立 
	15凉风 6睦月 3白雪 54浜风 74如月 77卯月 78初风 79初霜 86高波 55弥生
	6睦月　33皐月　42望月 59浦风 69卷云 94时津风 95天津风 
	54浜风  71朝潮 114朝霜 61舞风 80谷风 88霞 100满潮
	107清霜 108山云  111初春 112初雪 126秋云 115江风 109z1
其它：
	99明石 90秋津州
]] -- 

hcg={
[0]=function() return Win.Print("notdefined") end,
function() return cgall({67,46,58}) end, -- 3潜艇
function() return cgall({30,29,27,23,76,19}) end, --3-3北方任务
function() return cgall({27,1,9,35}) end, --1-5BOSS
function() return cgall({70,96,103,46,58}) end, --5潜艇
function() return cgall({5,62,52,64,66,31}) end,-- 3CL3DD（月常:水雷战队）
function() return cgall({97,44,43,72,20,52}) end, -- 水打南方へ
function() return cgall({43,56,60,19,31,79}) end, -- 「空母機動部隊」西へ!
function() return cgall({68,22,20,72,73,7}) end, -- 「第五戦隊」6ca 2Cav各一个桶
function() return cgall({48,22,62,64,66,31}) end, -- 水反 DD旗舰+CACL3DD cav不可
function() return cgall({29,72,73,45,11,48}) end, --2-5
function() return cgall({62,31,66,64,79,41}) end,  --1-6
function() return cgall({73,43,7,20,56,16}) end , --4-5
function() return cgall({98,106,43,110,56,60}) end, --4-5斩杀
function() return cgall({106,48,11,31,64,66}) end,  --演习BB+5DD
function() return cgall({106,64,70,19,45,76}) end,   --演习BB +DD+SS +3CLT
function() return cgall({62,48,31,11,64,66}) end,   --3-5 1CL5DD ,索敌15.7
function() return cgall({16,56,60,20,22,25}) end  --空母机动北方(3-5,381ZK)
}
ss2={ -- 2SS配置

[0]=function() return cgall({67,96}) end, 
function() return cgall({70,103}) end, 
function() return cgall({93,58}) end, 
function() return cgall({67,46}) end, 
function() return cgall({70,103}) end, 
function() return cgall({93,70}) end, 
function() return cgall({67,93}) end,
function() return cgall({93,67}) end
}

function 远征()
cgall({74,77,78,86},4)
cgall({10,6,3,54},3)
cgall({34,13,15,107,108},2)
end


function E3()
cgall({43,35,24,47,1,59})
cgall({5,7,68,9,64,15},2)
end
function E4()
cgall({90,102,18,60,17,56})
cgall({62,110,25,45,79,31},2)
end
function ZY()
cgall({11,107,8,30,17,38},3)
cgall({48,31,87,92,104,60},4)
end
if include_formedcag==nil then  ---仅在当前脚本执行
E4()
end