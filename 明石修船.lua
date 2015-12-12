require("\\Lua\\changebynew")
明石修理数量=3
明石编号=99

rl=1
--调用之前加入 include_修船=true

checked = 0
reppos = 2
function 有修复图标_闪()
local count = {}
table.insert(count,0,{[0]=747,180,12434732}) 
table.insert(count,0,{[0]=738,181,3355443}) 
return IsColorAll(count)
end

function 有修复图标()
local count = {}
table.insert(count,0,{[0]=765,183,10855470}) 
table.insert(count,{[0]=756,184,8158256}) 
table.insert(count,{[0]=761,166,16382717})
if 有修复图标_闪() then return true end
return IsColorAll(count)
end


function 添加修理船()
waitsta(34,146,3991279)
点击变更(reppos)
调整为破损排序()
tc(FExs[1],pagey) --翻到首页
顺序选择船(checked+1)
checked=checked+1
waitsta(611,415,6646383) Base.Sleep(700)
if (not Base.IsColor(678,452,7171615)) or 有修复图标() then
	tc(162,301) tc(162,301)
	waitsta(410,215,5870139)
	return false
end
Base.ClickRect(686,446)
waitsta(782,112,7105552)
Win.Print("添加了一个")
reppos=reppos+1
return true
end

function akashirep()
GoOrganize()
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----伴随舰解除
	Base.Sleep(1000)
end
Dcg(1,明石编号)
while reppos<(明石修理数量+2) and reppos<6 do
添加修理船()
end
backhome()
end

function 全部修理()
Kan.Repair(4)
akashirep()
end

if not include_修船 then
 akashirep() 
 if rl==1 then
	通用.等待母港(2000)
	Base.ClickRectEx(399,460,10,5) --释放
end
 end