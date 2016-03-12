--require("\\Lua\\BaseFunc")
delaylv=5
delaylvStk={}
--用setLv(newlv)  popLv() 设置和取消一个新的delaylv
function pushLv()
table.insert(delaylvStk,delaylv)
end

function popLv()
local n=#delaylvStk
if n>0 then 
	delaylv=delaylvStk[n]
	table.remove(delaylvStk)
end
end
function setLv(newlv)
pushLv() delaylv=newlv
end
function IsColorAll(array)
	local n=0
	local ok=0
	while(array[n] ~= nil)
	do
		if Base.IsColor(array[n][0],array[n][1],array[n][2])==true then
			ok = ok + 1
		end
		n= n+1
	end
	
	if ok==n then
		return true
		else
		return false
	end
end

function elem(s,tb) --判断某个元素是否在其中
for k,v in pairs(tb) do
	if(v==s) then return true end
end
return false
end

function p(...) --方便输出 p("a=",a)
local ostr=""
for k,v in ipairs({...}) do
	if v==true then v="true"
	elseif v==false then v="false"
	elseif v==nil then v="nil" end
	ostr=ostr..v
end
Win.Print(ostr)
end
function tc(a,b)
	Base.Click(a,b)
	Base.Sleep(delaylv*100)
end
function tcq(a,b) --更快
	Base.Click(a,b)
	Base.Sleep(1*100)
end
function td(n) --n-delaytime-akm
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))
	delaytime= math.random(5,20)
	if (n+1)%10 == 0 then 
              	delaytime=delaytime+60
              end
	if n<=1 then
		delaytime = 1
	end
	akm = "Random_Delay:%d休眠"
	Win.Print(akm:format(delaytime))
	Base.Sleep(1000*delaytime) 
end

local function 启动画面()
	local array = {}
	local count = {}
	
array = {[0]=569,193,4770794}
count[0] = array
array = {[0]=117,434,16777161}
count[1] = array
array = {[0]=503,321,13218434}
count[2] = array
array = {[0]=501,320,16777209}
count[3] = array
array = {[0]=485,404,9146127}
count[4] = array
array = {[0]=605,370,12498188}
count[5] = array

	return IsColorAll(count)

end
local function 母港2()
    array = {}
	local count = {}
    array = {[0]=207,254,1870818}; count[0] = array;
    return IsColorAll(count)
	
end

function 检查是否在母港()

	array = {}
	local counts = {}

	array = {[0]=204,247,2137083};counts[0] = array
	
	if 母港2() then return true end
	
	return IsColorAll(counts)

end
function backhome()
while not 检查是否在母港() do
 通用.回到母港()
 Base.Sleep(1000)
end
通用.等待母港(500)
end


function InMod()
    array = {};local count = {};
    array = {[0]=28,279,2328528}; count[0] = array;
    array = {[0]=20,299,10530090}; count[1] = array;
    return IsColorAll(count)
end

function InRepair()
count = {}
table.insert(count,0,{[0]=26,306,874980}) 
return IsColorAll(count)
end

function InFactory()
local count = {}
table.insert(count,0,{[0]=24,358,2511273}) 
return IsColorAll(count)
end

function InOrganize()
local s=Base.CallFunc("Base.FindColor","[2180435,871766,19028,1135461,4420492]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=16 or y~=158 then return false end
    return true
end

function InSupply()
    array = {};count = {};
    array = {[0]=32,189,1274316}; count[0] = array;
    array = {[0]=20,307,9805329}; count[1] = array;
    return IsColorAll(count)
end

function InFive()
count = {}
table.insert(count,0,{[0]=55,344,7582166}) 
table.insert(count,0,{[0]=77,342,12046059}) 
return IsColorAll(count)
end



function GoMod()
while not InMod() do
if InFive() then Base.Click(23,259)
else backhome() Base.Click(318,227) end
Base.Sleep(1000)
end
Win.Print("进入改修")
end


function GoOrganize()
while not InOrganize() do
if InFive() then Base.Click(27,159)
else backhome() Base.Click(201,133) end
Base.Sleep(1000)
end
waitsta(34,146,3991279)
Win.Print("进入编成")
end


function GoSupply()
while not InSupply() do
if InFive() then Base.Click(23,212)
else backhome() Base.Click(77,224) end
Base.Sleep(1000)
end
Win.Print("进入补给")
end


function GoFactory()
while not InFactory() do
if InFive() then Base.Click(26,367)
else backhome() Base.Click(276,373) end
Base.Sleep(1000)
end
Win.Print("进入工厂")
end

function GoRepair()
while not InRepair() do
if InFive() then Base.Click(25,316)
else backhome() Base.Click(123,362) end
Base.Sleep(1000)
end
Win.Print("进入入渠")
end


function waitsta(px,py,pc)
while not Base.IsColor(px,py,pc) do
	Base.Sleep(10)
end
end

function 刷新游戏()
p("刷新游戏！")
Base.ReLoad()
while 启动画面()==false do Base.Sleep(500) end  --等待加载结束
tc(655,400)
通用.等待母港(1500)
end

function iterator(t) --返回 key,value
    local k = 0;		--或使用pairs f, s, var = pairs(tt) k,v= f(s,var) k,v= f(s,k)
    return function()
        k = k + 1;            
        return k,t[k];
    end
end
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
