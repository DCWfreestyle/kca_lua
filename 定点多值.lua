require("\\Lua\\����")
require("\\Lua\\��װ��")

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

function ���װ��(equiT)

local y =120 + result2last(Ѱ��װ��(equiT))*30
tcq(556,y)

waitsta(644,438,5202221)
tcq(695,439)  --ȷ��
waitsta(358,458,4476242) --�ص���װ����
end
function ����ѡ��װ��(equiT)
tcq(446,173)
���ٷ�ҳ(equiT)
���װ��(equiT)
end
--����ѡ��װ��(�رܹ�())
--table_print(Ѱ��װ��(����()))


a,b=Ѱ��װ����Ϣ("�رܹ�")

