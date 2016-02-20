require("\\Lua\\BaseFunc")
require("\\Lua\\工具")
--调用 require("\\Lua\\换装备")
--换船page - 23
Eqpagenp={[0]=474,504,536,566,598,628}  --当前页（位置）检查
Eqpagey=446                     --点击Y
Eqpagexs={493,525,555,585,617}  --点击X
Eqfexs={409,443,653,691}  --四个箭头
delaylv=2

顺序有错的装备={      --当有其它装备存在时优先考虑其它装备
"大口径炮","鱼雷","电探"
}

装备={
小口径炮={
	{[0]={[0]=384,146,5987281},{[0]=385,139,5987281}
	}
	,1
},
高脚炮={
	{[0]={[0]=384,143,7851110},{[0]=376,150,7851110},{[0]=390,150,7851110},
	{[0]=389,142,7851110},{[0]=382,141,8107634} }
	,1
},
中口径炮={
	{[0]={[0]=385,147,4013516},{[0]=385,134,4013516} }
	,1
},
大口径炮={
	{[0]={[0]=381,138,2237122},{[0]=374,171,2237122} }
	,1
},
副炮={
	{[0]={[0]=392,143,60159} }
	,1
},
鱼雷={
	{[0]={[0]=391,141,11241304},{[0]=386,146,11241304}}
	,2
},

舰战={
	{[0]={[0]=385,146,7586915} }
	,3
},
舰爆={
	{[0]= {[0]=386,145,7171571}}
	,4
},
舰攻={
	{[0]={[0]=386,145,16102754} }
	,5
},
舰侦={
	{[0]={[0]=388,146,764640} }
	,6
},

水上机={
	{[0]={[0]=377,141,10079375} }
	,7
},
电探={
	{[0]={[0]=383,154,3513064}}
	,8
},
水听={
	{[0]={[0]=383,154,12234075}}
	,9
},
爆雷={
	{[0]={[0]=386,136,14208126},{[0]=383,141,9669727}}
	,10
},
回避锅={
	{[0]={[0]=382,150,5096703}}
	,11
},
三式弹={
	{[0]={[0]=384,147,8375666} }
	,12
},
撤甲弹={
	{[0]= {[0]=380,142,5987281},{[0]=377,137,5987281},{[0]=389,150,5987281}}
	,13
},
机枪={
	{[0]={[0]=383,143,7851110},{[0]=388,141,7851110},{[0]=379,147,7851110} }
	,14
},
损管={
	{[0]={[0]=378,140,16777215},{[0]=380,143,5329233} }
	,15
},
大发动艇={
	{[0]= {[0]=387,141,6137242}}
	,16
},

PAD={
	{[0]={[0]=381,146,11435673} }
	,17
},
探照灯={
	{[0]={[0]=381,139,4754162},{[0]=383,140,3243245 }}
	,18
},
桶={
	{[0]={[0]=383,142,10658466} }
	,19
},
照明弹={
	{[0]= {[0]=386,139,39935},{[0]=378,151,7588351}}
	,20
},
司令部={
	{[0]={[0]=384,141,13733541} }
	,21
},
高射装置={
	{[0]={[0]=379,142,5085833} }
	,22
},
WG42={
	{[0]={[0]=386,138,3553023},{[0]=380,142,3553023} }
	,23
},
见张员={
	{[0]={[0]=383,145,10480575}}
	,24
},
战斗粮食={
	{[0]={[0]=384,140,16777215},{[0]=383,146,3881516},{[0]=381,145,3881516} }
	,25
},
补给={
	{[0]={[0]=381,137,10405217} }
	,26
}
}
function EqCurrentSelected()
local s="-1,-1"
while s=="-1,-1" do
	s=Base.CallFunc("Base.FindColor","[12697118]")
end
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
for n=1,5 do
	if x>Eqpagenp[n-1] and x<Eqpagenp[n] then return n end
end
end

function Eqfrontpage()
local cs= EqCurrentSelected()
if cs~=1 then 
	tcq(Eqpagexs[cs-1],Eqpagey)
else
	Win.Print("已经是第一页，不能向前")
	return false
end
return true
end

function Eqnextpage()
local cs= EqCurrentSelected()
if cs~=5 then
	tcq(Eqpagexs[cs+1],Eqpagey)
else
	Win.Print("已经是第最后一页，不能向后翻")
	return false
end
return true
end

function 解除所有装备()
local y
if slot状态(3)==-1 then y=  229       --2格
elseif slot状态(4)==-1 then y=	264	--3格
else y= 295
end

Base.ClickRectEx (325,y,5,5)

while not Base.IsColor(362,175,3031079) do
Base.ClickRectEx (325,y,5,5)
Base.Sleep(300)
end
waitsta(362,175,3031079)

end
function slot状态(i) --0空，1有，-1不可用
if i==1 then 
	if Base.IsColor(362,175,3031079) then return 0 
	else return 1 end
elseif i==2 then
	if Base.IsColor(362,207,2965543) then return 0 
	else return 1 end
elseif i==3 then
	if Base.IsColor(362,242,3292204) then return 0 
	elseif Base.IsColor(359,242,13624046) then return -1
	else return 1 end
elseif i==4 then
	if Base.IsColor(361,273,3161897) then return 0 
	elseif Base.IsColor(357,272,13689584) then return -1
	else return 1 end
end
end

function 选择一个空的slot()
if slot状态(1) == 0 then 
	tcq(362,175)
elseif slot状态(2) == 0 then
	tcq(362,207)
elseif slot状态(3) == 0 then
	tcq(362,242)
elseif slot状态(4) == 0 then
	tcq(361,273)
else
	return false ---选择失败，且不能再选择
end
waitsta(395,448,10592291) 
return true  --选择成功
end

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

function getOrderOfNow() --取得一个现在的order
local order
while order ==nil do
for k,v in pairs(装备) do
	if EqExist(v[1]) then 
		order = v[2]
		--p(k)
		if not elem (k,顺序有错的装备 ) then break end --如果这个装备不是易错的，就停止
	end
end
end  ---while 
return order
end
function 快速翻页(equiT,order)
local orderOfNow
local direct    --翻页的方向 ，-1左1右
local found=false
if EqExist(equiT)==false then
	orderOfNow =getOrderOfNow()
	if orderOfNow>order then direct=-1   --应该往左
	elseif orderOfNow==order then direct =0  p(order) --不知道在左在右,编号一样却不在这页
	else direct=1 end  --应该往右
else
	return true        --一开始就有了
end
local i =0
if direct==-1 then
	tc(Eqfexs[2],Eqpagey)
	while getOrderOfNow()>order do --do-while
		tcq(Eqfexs[2],Eqpagey)
	end
	i=0
	while i<6 do
		if EqExist(equiT) then found=true break end
		if Eqnextpage()==false then break end
		i=i+1
	end
elseif direct==1 then
	tc(Eqfexs[3],Eqpagey)
	while getOrderOfNow()<order do --do-while
		tcq(Eqfexs[3],Eqpagey)
	end
	i=0
	while i<6 do
		if EqExist(equiT) then found=true break end
		if Eqfrontpage()==false then break end
		i=i+1
	end
elseif direct==0 then
	if order == 1 then 慢速翻页(equiT) found=true 
	else
		while getOrderOfNow()==order do --do-while
			tc(Eqfexs[2],Eqpagey)
		end
		while i<6 do
			if EqExist(equiT) then found=true break end
			if Eqnextpage()==false then break end
			i=i+1
		end
	end
end
if not found then return 慢速翻页(equiT) end
return true
end
function 点击装备(equiT)

local y =120 + result2last(寻找装备(equiT))*30
tcq(556,y)

waitsta(644,438,5202221)
tcq(695,439)  --确认
waitsta(358,458,4476242) --回到改装界面
Base.Sleep(500)
end
function 慢速选择装备(equiT)
慢速翻页(equiT) 
点击装备(equiT)
end

function 快速选择装备(equiT,order)
快速翻页(equiT,order)
点击装备(equiT)
end

function 换装备(slot,name)
GoMod()
-- TODO
end

function 换上回避锅(i)  --尽可能换上锅，已有装备不会被换下
GoMod()
tc (199,169+(i-1)*55) Base.Sleep(300)
while 选择一个空的slot() do
	快速选择装备(寻找装备信息("回避锅"))
end
backhome()
end

function 换下回避锅()
-- TODO
GoMod()
解除所有装备()
backhome()
end
function 某位可换(pos)
waitsta(357,471,7640484)
local cx=150
local cy=186+(pos-1)*55
local c=1926911
tc(199,169+(pos-1)*55)
return Base.IsColor(cx,cy,c) and Base.IsColor(581,448,6908196)
end
function 改修选择舰队(kantaiNum)
tc(147+(kantaiNum-1)*30,112)
end

function 全上桶(kantaiNum) --为某舰队尽可能换上桶
GoMod()
改修选择舰队(kantaiNum)
for pos=1,6 do
	if 某位可换(pos) then --这个函数已经选择船
		while 选择一个空的slot() do
			快速选择装备(寻找装备信息("桶"))
		end
	end
end
end