require("\\Lua\\BaseFunc")
require("\\Lua\\����")
--���� require("\\Lua\\��װ��")
--����page - 23
Eqpagenp={[0]=474,504,536,566,598,628}  --��ǰҳ��λ�ã����
Eqpagey=446                     --���Y
Eqpagexs={493,525,555,585,617}  --���X
Eqfexs={409,443,653,691}  --�ĸ���ͷ
delaylv=2

˳���д��װ��={      --��������װ������ʱ���ȿ�������װ��
"��ھ���","����","��̽"
}

װ��={
С�ھ���={
	{[0]={[0]=384,146,5987281},{[0]=385,139,5987281}
	}
	,1
},
�߽���={
	{[0]={[0]=384,143,7851110},{[0]=376,150,7851110},{[0]=390,150,7851110},
	{[0]=389,142,7851110},{[0]=382,141,8107634} }
	,1
},
�пھ���={
	{[0]={[0]=385,147,4013516},{[0]=385,134,4013516} }
	,1
},
��ھ���={
	{[0]={[0]=381,138,2237122},{[0]=374,171,2237122} }
	,1
},
����={
	{[0]={[0]=392,143,60159} }
	,1
},
����={
	{[0]={[0]=391,141,11241304},{[0]=386,146,11241304}}
	,2
},

��ս={
	{[0]={[0]=385,146,7586915} }
	,3
},
����={
	{[0]= {[0]=386,145,7171571}}
	,4
},
����={
	{[0]={[0]=386,145,16102754} }
	,5
},
����={
	{[0]={[0]=388,146,764640} }
	,6
},

ˮ�ϻ�={
	{[0]={[0]=377,141,10079375} }
	,7
},
��̽={
	{[0]={[0]=383,154,3513064}}
	,8
},
ˮ��={
	{[0]={[0]=383,154,12234075}}
	,9
},
����={
	{[0]={[0]=386,136,14208126},{[0]=383,141,9669727}}
	,10
},
�رܹ�={
	{[0]={[0]=382,150,5096703}}
	,11
},
��ʽ��={
	{[0]={[0]=384,147,8375666} }
	,12
},
���׵�={
	{[0]= {[0]=380,142,5987281},{[0]=377,137,5987281},{[0]=389,150,5987281}}
	,13
},
��ǹ={
	{[0]={[0]=383,143,7851110},{[0]=388,141,7851110},{[0]=379,147,7851110} }
	,14
},
���={
	{[0]={[0]=378,140,16777215},{[0]=380,143,5329233} }
	,15
},
�󷢶�ͧ={
	{[0]= {[0]=387,141,6137242}}
	,16
},

PAD={
	{[0]={[0]=381,146,11435673} }
	,17
},
̽�յ�={
	{[0]={[0]=381,139,4754162},{[0]=383,140,3243245 }}
	,18
},
Ͱ={
	{[0]={[0]=383,142,10658466} }
	,19
},
������={
	{[0]= {[0]=386,139,39935},{[0]=378,151,7588351}}
	,20
},
˾�={
	{[0]={[0]=384,141,13733541} }
	,21
},
����װ��={
	{[0]={[0]=379,142,5085833} }
	,22
},
WG42={
	{[0]={[0]=386,138,3553023},{[0]=380,142,3553023} }
	,23
},
����Ա={
	{[0]={[0]=383,145,10480575}}
	,24
},
ս����ʳ={
	{[0]={[0]=384,140,16777215},{[0]=383,146,3881516},{[0]=381,145,3881516} }
	,25
},
����={
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
	Win.Print("�Ѿ��ǵ�һҳ��������ǰ")
	return false
end
return true
end

function Eqnextpage()
local cs= EqCurrentSelected()
if cs~=5 then
	tcq(Eqpagexs[cs+1],Eqpagey)
else
	Win.Print("�Ѿ��ǵ����һҳ���������")
	return false
end
return true
end

function �������װ��()
local y
if slot״̬(3)==-1 then y=  229       --2��
elseif slot״̬(4)==-1 then y=	264	--3��
else y= 295
end

Base.ClickRectEx (325,y,5,5)

while not Base.IsColor(362,175,3031079) do
Base.ClickRectEx (325,y,5,5)
Base.Sleep(300)
end
waitsta(362,175,3031079)

end
function slot״̬(i) --0�գ�1�У�-1������
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

function ѡ��һ���յ�slot()
if slot״̬(1) == 0 then 
	tcq(362,175)
elseif slot״̬(2) == 0 then
	tcq(362,207)
elseif slot״̬(3) == 0 then
	tcq(362,242)
elseif slot״̬(4) == 0 then
	tcq(361,273)
else
	return false ---ѡ��ʧ�ܣ��Ҳ�����ѡ��
end
waitsta(395,448,10592291) 
return true  --ѡ��ɹ�
end

function Ѱ��װ����Ϣ(name) --����װ������ȡequiT��Ϣ����������
local equiT = false
local order =false
for k,v in pairs(װ��) do
	if (k==name) then 
		equiT= v[1] 
		order=v[2]
	end
end
return equiT,order
end


function ����������(tb,deltaY) --���ò����Ӱ�촫���tb,װ����Ϣ���仯
local ttb 
ttb=copyTab(tb)  ----����һ������ ���
for k,v in pairs(ttb) do
	v[1]=v[1]+deltaY
end
return ttb
end

function Ѱ��װ��(equiT) --������浽�� result[1]=true���ڣ�=false������
local result={}
local ttb
for i=0,9 do
ttb=����������(equiT,30*i)
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

function result2Bool(result) --���������Ϊ����ֵ
for i=1,10 do
	if result[i] then return true end
end
return false
end

function result2last(result) --�����ת�������һ��װ����ֵ(1-10)
local i=10
while i>0 do
	if result[i] then return i end
	i=i-1
end
return false
end

function EqExist(equiT)
return result2Bool(Ѱ��װ��(equiT))
end

function ���ٷ�ҳ(equiT)
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

function getOrderOfNow() --ȡ��һ�����ڵ�order
local order
while order ==nil do
for k,v in pairs(װ��) do
	if EqExist(v[1]) then 
		order = v[2]
		--p(k)
		if not elem (k,˳���д��װ�� ) then break end --������װ�������״�ģ���ֹͣ
	end
end
end  ---while 
return order
end
function ���ٷ�ҳ(equiT,order)
local orderOfNow
local direct    --��ҳ�ķ��� ��-1��1��
local found=false
if EqExist(equiT)==false then
	orderOfNow =getOrderOfNow()
	if orderOfNow>order then direct=-1   --Ӧ������
	elseif orderOfNow==order then direct =0  p(order) --��֪����������,���һ��ȴ������ҳ
	else direct=1 end  --Ӧ������
else
	return true        --һ��ʼ������
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
	if order == 1 then ���ٷ�ҳ(equiT) found=true 
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
if not found then return ���ٷ�ҳ(equiT) end
return true
end
function ���װ��(equiT)

local y =120 + result2last(Ѱ��װ��(equiT))*30
tcq(556,y)

waitsta(644,438,5202221)
tcq(695,439)  --ȷ��
waitsta(358,458,4476242) --�ص���װ����
Base.Sleep(500)
end
function ����ѡ��װ��(equiT)
���ٷ�ҳ(equiT) 
���װ��(equiT)
end

function ����ѡ��װ��(equiT,order)
���ٷ�ҳ(equiT,order)
���װ��(equiT)
end

function ��װ��(slot,name)
GoMod()
-- TODO
end

function ���ϻرܹ�(i)  --�����ܻ��Ϲ�������װ�����ᱻ����
GoMod()
tc (199,169+(i-1)*55) Base.Sleep(300)
while ѡ��һ���յ�slot() do
	����ѡ��װ��(Ѱ��װ����Ϣ("�رܹ�"))
end
backhome()
end

function ���»رܹ�()
-- TODO
GoMod()
�������װ��()
backhome()
end
function ĳλ�ɻ�(pos)
waitsta(357,471,7640484)
local cx=150
local cy=186+(pos-1)*55
local c=1926911
tc(199,169+(pos-1)*55)
return Base.IsColor(cx,cy,c) and Base.IsColor(581,448,6908196)
end
function ����ѡ�񽢶�(kantaiNum)
tc(147+(kantaiNum-1)*30,112)
end

function ȫ��Ͱ(kantaiNum) --Ϊĳ���Ӿ����ܻ���Ͱ
GoMod()
����ѡ�񽢶�(kantaiNum)
for pos=1,6 do
	if ĳλ�ɻ�(pos) then --��������Ѿ�ѡ��
		while ѡ��һ���յ�slot() do
			����ѡ��װ��(Ѱ��װ����Ϣ("Ͱ"))
		end
	end
end
end