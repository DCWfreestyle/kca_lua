require("\\Lua\\工具")
require("\\Lua\\换装备")

function 寻找装备信息(name) --根据装备名获取equiT信息表和排序序号
local equiT = false
local order =false
for k,v in pairs(装备) do
	if (k==name) then 
		equiT= v[1] 
		order=v[2]
	end
end
return equiT,order
end


function 调整纵坐标(tb,deltaY) --调用不后会影响传入的tb,装备信息不变化
local ttb 
ttb=copyTab(tb)  ----制造一个副本 深拷贝
for k,v in pairs(ttb) do
	v[1]=v[1]+deltaY
end
return ttb
end

function 寻找装备(equiT) --结果保存到表 result[1]=true存在，=false不存在
local result={}
local ttb
for i=0,9 do
ttb=调整纵坐标(equiT,30*i)
	if IsColorAll(ttb) then
		result[i+1]=true
	else
		result[i+1]=false
--[[		Win.Print(i+1)
		--table_print(ttb)
		Win.Print(Base.GetColor(ttb[0][0],ttb[0][1])) 
		Win.Print(ttb[0][2])
		Win.Print("\n")
		]]
	end
end
return result
end

function result2Bool(result) --将结果返回为布尔值
for i=1,10 do
	if result[i] then return true end
end
return false
end

function result2last(result) --将结果转换成最后一个装备的值(1-10)
local i=10
while i>0 do
	if result[i] then return i end
	i=i-1
end
return false
end

function EqExist(equiT)
return result2Bool(寻找装备(equiT))
end

function 慢速翻页(equiT)
waitsta(395,448,10592291)
tcq(Eqfexs[1],Eqpagey)
local ret
while EqExist(equiT)==false do
	ret= Eqnextpage()
	if ret==false then return false end
	if delaylv<200 then Base.Sleep(100) end
end
return true
end

function 点击装备(equiT)

local y =120 + result2last(寻找装备(equiT))*30
tcq(556,y)

waitsta(644,438,5202221)
tcq(695,439)  --确认
waitsta(358,458,4476242) --回到改装界面
end
function 慢速选择装备(equiT)
tcq(446,173)
慢速翻页(equiT)
点击装备(equiT)
end
--慢速选择装备(回避锅())
--table_print(寻找装备(鱼雷()))


a,b=寻找装备信息("回避锅")

