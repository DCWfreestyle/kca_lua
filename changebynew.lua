require("\\Lua\\BaseFunc")
pagenp={[0]=497,527,559,589,621,651}  --当前页（位置）检查
pagey=446                     --点击Y
pagexs={516,548,578,608,640}  --点击X
FExs={432,466,676,714}  --四个箭头
chbut={{408,212}}
inied=false
dcgloop=false
cgen =1              --等于0就关闭changekan函数,没卵用
pagedelaylv=2
--[[

cg(被换舰娘的位置,换上舰娘的序号) 序号按获得顺序排列，初始舰为1，拆掉的
不被算入，使用kcv等工具可以得到
require("\\Lua\\changebynew")
cg()
cgall()
cgb()
cgInGroups()
cgallbutflag()
]]

--[[
使用cgInGroups()前,设置 
groups={
		{7,20,81,83,14,22,40,39,72,73,25,36},
		{1,2,3,4,5}
		}
cgstas={					--[位置]={组,组内序号}
		[2]={1,1},
		[3]={1,1},
		[4]={2,1}
		}
]]
function CurrentSelected()
local s="-1,-1"
while s=="-1,-1" do
	s=Base.CallFunc("Base.FindColor","[12697118]")
end
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
for n=1,5 do
	if x>pagenp[n-1] and x<pagenp[n] then return n end
end
end
function frontpage()
local cs= CurrentSelected()
if cs~=1 then 
	tc(pagexs[cs-1],pagey)
else
	Win.Print("已经是第一页，不能向前")
	return false
end
return true
end
function nextpage()
local cs= CurrentSelected()
if cs~=5 then
	tc(pagexs[cs+1],pagey)
else
	Win.Print("已经是最后一页，不能向后翻")
	return false
end
return true
end

function pre(pnum)
if pnum>4 then       --5页5页地点
	while pnum>4 do
		local cs= CurrentSelected()
		if cs~=1 then 
			tc(FExs[2],pagey)
		else
			Win.Print("已经是第一页，不能向前")
			return false
		end
		pnum=pnum-5
	end
	pre(pnum)
elseif pnum==4 then
	local cs= CurrentSelected()
	if cs==5 then tc(pagexs[1],pagey)
	elseif cs==4 then tc(pagexs[cs-3],pagey) pre(1)  --尽量减少对CurrentSelected()的调用
	elseif cs==3 then tc(pagexs[cs-2],pagey) pre(2)
	elseif cs<3 then Win.Print("不能再向前翻4页了") return false
	end
elseif pnum==3 then
	local cs= CurrentSelected()
	if cs>=4 then tc(pagexs[cs-3],pagey)
	elseif cs==3 then tc(pagexs[cs-2],pagey) pre(1)
	elseif cs<3 then Win.Print("不能再向前翻3页了") return false
	end
elseif pnum==2 then
	local cs= CurrentSelected()
	if cs>=3 then tc(pagexs[cs-2],pagey)
	elseif cs<3 then Win.Print("不能再向前翻2页了") return false
	end
elseif pnum==1 then
	return frontpage()
elseif pnum==0 then 
	return true
end

return true
end

function next(pnum)
while pnum>0 do
if nextpage() ==false then return false end
pnum=pnum-1
end
return true
end
function 检查是否是new排序()
local s=Base.CallFunc("Base.FindColor","[8224573,9474092,9474092,13488566,9474092,9474092,10066495,15922943,15922943,9474092,9474092,9474092,15922943,13488566,9474092,11382379,9474092,11382379,9474092,9474092]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=765 or y~=113 then return false end
    return true
end
function 检查是否是破损排序()
local s=Base.CallFunc("Base.FindColor","[9868580,16777215,9868580,11645024,16579833,16777215,16316658,11710816,10329141,12829315,15395540,15987686,13421462,10855492,9868580,8816172,7303479,7764030,7764030,7764030]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=772 or y~=109 then return false end
    return true
end
function 检查是否在编成()
local s=Base.CallFunc("Base.FindColor","[2180435,871766,19028,1135461,4420492]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=16 or y~=158 then return false end
    return true
end

function 只有单舰()
local count = {}
table.insert(count,0,{[0]=633,206,4605510}) 
return IsColorAll(count)
end


function 检查是否在变更()
local s=Base.CallFunc("Base.FindColor","[4145729,4079936,3816764,15462125,13619921,15527918,16250623,13421526,15790074,13816284,15132144,14211042,11645115,9473946,12368838,16053246,15790074,14079456,10526634,11710908]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=429 or y~=109 then return false end
    return true
end


function selectKantai(kantai)
if kantai==nil then kantai = 1 end
local selected={
{142,117,10263330}, --第一舰队
{167,121,10592291},
{201,117,10460707},
{230,117,10526499}
}
Base.IsColor()
while Base.IsColor(selected[kantai][1],
                   selected[kantai][2],
				   selected[kantai][3])==false do
Base.Click(selected[kantai][1], selected[kantai][2])
Base.Sleep(500)
end


end



function 调整为new排序()
while 检查是否是new排序() == false do tc(773,110) Base.Sleep(100) end
end

function 调整为破损排序()
while 检查是否是破损排序() == false do tc(773,110) Base.Sleep(100) end
end
function emptyn()
for n=1,10 do
	if not Base.IsColor(758,136+n*28,11580143) then
		return 10-n+1
	end
end
return 0
end

function 点击变更(cp)
--408/750 212/325/438
local dx=(cp+1)%2
local dy,_=math.modf((cp-1)/2)
waitsta(790,463,13292250)
if not (Base.IsColor(410+dx*342,215+dy*113,13229005) or Base.IsColor(410+dx*342,215+dy*113,5870139)) then
	Win.Print("该位置无效,失败")
	return false
end
tc(408+dx*342,212+dy*113)
waitsta(418,447,10592291)
return true
end

function 进入编成()
GoOrganize()
return true
end

function 选择页(shipnum) 
local pagenum=math.modf((shipnum-1)/10)
pre(pagenum)

end

function 页内选择(shipnum)
local m = shipnum%10-1
if m==(-1) then m=9 end
tc(575,418-m*28)
end
function 倒序选择船(shipnum) --从最后一页开始翻
选择页(shipnum) 
页内选择(shipnum)
end
function 顺序选择船(shipnum)
--tc(FExs[1],pagey)   --翻到首页
local pagenum=math.modf((shipnum-1)/10)
next(pagenum)
local m = shipnum%10-1
if m==(-1) then m=9 end
tc(575,166+m*28)
end
function 换上僚舰() --刷闪用
--进入编成()
if not 点击变更(2) then
	--backhome() 
	return false 
end
调整为new排序()
tcq(FExs[1],pagey)
if Base.IsColor(757,163,12238068) then
	Win.Print("换船:换僚舰有锁")
	tc(223,231)
	return false
end
tc(491,169)
Base.Sleep(700)
tc(689,441) -------有几率会失败，因为一个舰队内不能有两只船相同,错误会被忽略
if Base.IsColor(668,435,11776691) then tc(109,189) tc(109,189) return false end
--backhome()
return true
end

function 换下僚舰()
--进入编成()
Base.Sleep(500)
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----伴随舰解除
	Base.Sleep(1000)
end
--backhome()   --不回母港
end
function 僚舰大破处理() 
waitsta(792,460,13752544)
if ( not(Base.IsColor(748,161,1586304) or Base.IsColor(747,162,2435430) or Base.IsColor(750,168,3355778)) )   --白黄
then return true end           --非大破就不处理
p("僚舰大破处理：僚舰大破")
if dropkan <= 1 then --那就单舰吧
	换下僚舰()
else
	dropkan=dropkan-破损解体(1)
	进入编成() 换下僚舰() 换上僚舰() 僚舰大破处理()
end
end
function Dcg(n1,n2)  --子操作
local ln1=n1
local ln2=n2

-- pagedelaylv

if not 点击变更(ln1) then Win.Print("换船：换船失败") return false end

setLv(pagedelaylv)
调整为new排序()
tc(FExs[4],pagey)
ln2=emptyn()+ln2
选择页(ln2)
页内选择(ln2)
popLv()

waitsta(611,415,6646383)
Base.Sleep(100)
if not Base.IsColor(678,452,7171615) then 
	if ln1==1 and not dcgloop then 
		local ti=n2+1 --换另一个试试，看是否是由同一条船造成失败
		tc(162,301) tc(162,301)
		waitsta(410,215,5870139)
		dcgloop=true
		while (Dcg(1,ti)==false) and (ti-ln2)<4 do  --循环尝试4次
			tc(162,301) tc(162,301) 
			waitsta(410,215,5870139)
			ti=ti+1
		end
		waitsta(410,215,5870139)
		if not Dcg(n1,n2) then 
			dcgloop=false
			return false 
		end
	elseif dcgloop then 
	Win.Print("换船：尝试失败")
	dcgloop=false
	return false
	else
	Win.Print("换船：换船失败")
	--backhome()
	return false
	end
end
Base.ClickRect(686,446)
waitsta(782,112,7105552)
Win.Print("换船:完成一次")
return true
end
function cg(n1,n2)
进入编成()
local rt=Dcg(n1,n2)
backhome()
return rt
end
  
function cgb(g)  -- 格式g={{n1,n2},{n1,n2},...}
进入编成()
Base.Sleep(500)
local rt
local i,n1,n2
i=1
while g[i]~=nil do
	n1=i
	n2=g[i]
	rt=Dcg(n1,n2)
	if not rt then  return false end
	i=i+1
end

backhome()
Win.Pop("换船:批量换船完成!",true)
return true
end

function cgall(g,kannum)  --g={n2,n2,n2.。。。}
进入编成()
selectKantai(kannum)
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----伴随舰解除
	Base.Sleep(1000)
end
local i,n1,n2,rt
i=1
while g[i]~=nil do
	n1=i
	n2=g[i]
	rt=Dcg(n1,n2)
	if not rt then backhome() Win.Print("cgall:换船失败")  return false end
	i=i+1
end
backhome()
Win.Print("cgall:批量换船完成!")
return true
end

function cgInGroupsPreviousVersion()  --cgInGroups以前的版本
--[[
使用changekan前设置
kana={[0]=7,20,81,83,14,22,40,39,72,73,25,36} --更换
cgp={[0]=2,3}
ncg=#kana+1
cgsta={[0]=0}
]]
if cgen~=1 then return false end
if inied==false then
	inied=true
	for nt=1,#cgp do
		local tp = cgsta[nt-1]
		table.insert(cgsta,(tp+math.modf(ncg/(#cgp+1)))%ncg)
	end
	for _,i in pairs(cgsta) do
		Win.Print(i)
	end
end

local pi
local pn

进入编成()
for pi=0,#cgp do
	for pn=1,ncg do
	scg=Dcg(cgp[pi],kana[cgsta[pi]])
	cgsta[pi]=(cgsta[pi]+1)%ncg
	if scg==true then break end
	end
	if not scg then Win.Print("换船:失败") return false end
end
backhome()
return true
end

function ini()
if inied then return false end
inied=true
--在changekan()使用前必须调用一次
for keyg,group in pairs(groups) do  			--对每个组进行检查
	theNumOfPostionsBelong2group=0
	for keys,cgsta in pairs(cgstas) do		--先计算对于group有多少个位置在使用
		if cgsta[1]==keyg then theNumOfPostionsBelong2group=theNumOfPostionsBelong2group+1 end
	end
	local firstpos=999
	local order=-1
	for keys,cgsta in pairs(cgstas) do		--找到第一个使用这个group的位置,序号从它开始划分
		if cgsta[1]==keyg and keys<firstpos then firstpos=keys order=cgsta[2] end
	end
	for keys,cgsta in pairs(cgstas) do		--更改序号
		if cgsta[1]==keyg and keys~=firstpos then 
			cgsta[2]=(order-1+math.modf((#groups[cgsta[1]])/theNumOfPostionsBelong2group))%(#groups[cgsta[1]])+1   --尽量地均匀划分
			order = cgsta[2] --更新order用于下次计算
		end
	end
end
end

function cgInGroups()
ini()
if cgen~=1 then return false end

local cgp       --位置
local cgn		--编号
local scg		--成功失败判定
进入编成()
for key,cgsta in pairs(cgstas) do
	cgp=key
	for mtry=1,#groups[cgsta[1]] do
		cgn=groups[cgsta[1]][cgsta[2]]
		scg=Dcg(cgp,cgn)
		cgsta[2]=(cgsta[2])%(#groups[cgsta[1]])+1
		if scg==true then break end
		tc(201,263) waitsta(713,449,8898001) tc(211,269) waitsta(795,458,14147559)
	end
	if not scg then Win.Print("cgInGroups:失败") return false end
end
backhome()
Win.Print("cgInGroups:批量换船完成!")
return true
end

function cgallbutflag(g,kannum)        --替换除开旗舰之外的船
进入编成()
selectKantai(kannum)
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----伴随舰解除
	Base.Sleep(1000)
end
local i,n1,n2,rt
i=1
while g[i]~=nil do
	n1=i+1
	n2=g[i]
	rt=Dcg(n1,n2)
	if not rt then backhome() Win.Print("cgallbutflag:换船失败") return false end
	i=i+1
end
backhome()
Win.Print("cgallbutflag:批量换船完成!")
return true
end