require("\\Lua\\BaseFunc")
pagenp={[0]=497,527,559,589,621,651}  --��ǰҳ��λ�ã����
pagey=446                     --���Y
pagexs={516,548,578,608,640}  --���X
FExs={432,466,676,714}  --�ĸ���ͷ
chbut={{408,212}}
inied=false
dcgloop=false
cgen =1              --����0�͹ر�changekan����,û����
pagedelaylv=2
--[[

cg(���������λ��,���Ͻ�������) ��Ű����˳�����У���ʼ��Ϊ1�������
�������룬ʹ��kcv�ȹ��߿��Եõ�
require("\\Lua\\changebynew")
cg()
cgall()
cgb()
cgInGroups()
cgallbutflag()
]]

--[[
ʹ��cgInGroups()ǰ,���� 
groups={
		{7,20,81,83,14,22,40,39,72,73,25,36},
		{1,2,3,4,5}
		}
cgstas={					--[λ��]={��,�������}
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
	Win.Print("�Ѿ��ǵ�һҳ��������ǰ")
	return false
end
return true
end
function nextpage()
local cs= CurrentSelected()
if cs~=5 then
	tc(pagexs[cs+1],pagey)
else
	Win.Print("�Ѿ������һҳ���������")
	return false
end
return true
end

function pre(pnum)
if pnum>4 then       --5ҳ5ҳ�ص�
	while pnum>4 do
		local cs= CurrentSelected()
		if cs~=1 then 
			tc(FExs[2],pagey)
		else
			Win.Print("�Ѿ��ǵ�һҳ��������ǰ")
			return false
		end
		pnum=pnum-5
	end
	pre(pnum)
elseif pnum==4 then
	local cs= CurrentSelected()
	if cs==5 then tc(pagexs[1],pagey)
	elseif cs==4 then tc(pagexs[cs-3],pagey) pre(1)  --�������ٶ�CurrentSelected()�ĵ���
	elseif cs==3 then tc(pagexs[cs-2],pagey) pre(2)
	elseif cs<3 then Win.Print("��������ǰ��4ҳ��") return false
	end
elseif pnum==3 then
	local cs= CurrentSelected()
	if cs>=4 then tc(pagexs[cs-3],pagey)
	elseif cs==3 then tc(pagexs[cs-2],pagey) pre(1)
	elseif cs<3 then Win.Print("��������ǰ��3ҳ��") return false
	end
elseif pnum==2 then
	local cs= CurrentSelected()
	if cs>=3 then tc(pagexs[cs-2],pagey)
	elseif cs<3 then Win.Print("��������ǰ��2ҳ��") return false
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
function ����Ƿ���new����()
local s=Base.CallFunc("Base.FindColor","[8224573,9474092,9474092,13488566,9474092,9474092,10066495,15922943,15922943,9474092,9474092,9474092,15922943,13488566,9474092,11382379,9474092,11382379,9474092,9474092]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=765 or y~=113 then return false end
    return true
end
function ����Ƿ�����������()
local s=Base.CallFunc("Base.FindColor","[9868580,16777215,9868580,11645024,16579833,16777215,16316658,11710816,10329141,12829315,15395540,15987686,13421462,10855492,9868580,8816172,7303479,7764030,7764030,7764030]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=772 or y~=109 then return false end
    return true
end
function ����Ƿ��ڱ��()
local s=Base.CallFunc("Base.FindColor","[2180435,871766,19028,1135461,4420492]")
local _,_,x,y=string.find(s, "^(-?%d+),(-?%d+)$")
x=tonumber(x)
y=tonumber(y)
if x~=16 or y~=158 then return false end
    return true
end

function ֻ�е���()
local count = {}
table.insert(count,0,{[0]=633,206,4605510}) 
return IsColorAll(count)
end


function ����Ƿ��ڱ��()
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
{142,117,10263330}, --��һ����
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



function ����Ϊnew����()
while ����Ƿ���new����() == false do tc(773,110) Base.Sleep(100) end
end

function ����Ϊ��������()
while ����Ƿ�����������() == false do tc(773,110) Base.Sleep(100) end
end
function emptyn()
for n=1,10 do
	if not Base.IsColor(758,136+n*28,11580143) then
		return 10-n+1
	end
end
return 0
end

function ������(cp)
--408/750 212/325/438
local dx=(cp+1)%2
local dy,_=math.modf((cp-1)/2)
waitsta(790,463,13292250)
if not (Base.IsColor(410+dx*342,215+dy*113,13229005) or Base.IsColor(410+dx*342,215+dy*113,5870139)) then
	Win.Print("��λ����Ч,ʧ��")
	return false
end
tc(408+dx*342,212+dy*113)
waitsta(418,447,10592291)
return true
end

function ������()
GoOrganize()
return true
end

function ѡ��ҳ(shipnum) 
local pagenum=math.modf((shipnum-1)/10)
pre(pagenum)

end

function ҳ��ѡ��(shipnum)
local m = shipnum%10-1
if m==(-1) then m=9 end
tc(575,418-m*28)
end
function ����ѡ��(shipnum) --�����һҳ��ʼ��
ѡ��ҳ(shipnum) 
ҳ��ѡ��(shipnum)
end
function ˳��ѡ��(shipnum)
--tc(FExs[1],pagey)   --������ҳ
local pagenum=math.modf((shipnum-1)/10)
next(pagenum)
local m = shipnum%10-1
if m==(-1) then m=9 end
tc(575,166+m*28)
end
function �����Ž�() --ˢ����
--������()
if not ������(2) then
	--backhome() 
	return false 
end
����Ϊnew����()
tcq(FExs[1],pagey)
if Base.IsColor(757,163,12238068) then
	Win.Print("����:���Ž�����")
	tc(223,231)
	return false
end
tc(491,169)
Base.Sleep(700)
tc(689,441) -------�м��ʻ�ʧ�ܣ���Ϊһ�������ڲ�������ֻ����ͬ,����ᱻ����
if Base.IsColor(668,435,11776691) then tc(109,189) tc(109,189) return false end
--backhome()
return true
end

function �����Ž�()
--������()
Base.Sleep(500)
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----���潢���
	Base.Sleep(1000)
end
--backhome()   --����ĸ��
end
function �Ž����ƴ���() 
waitsta(792,460,13752544)
if ( not(Base.IsColor(748,161,1586304) or Base.IsColor(747,162,2435430) or Base.IsColor(750,168,3355778)) )   --�׻�
then return true end           --�Ǵ��ƾͲ�����
p("�Ž����ƴ����Ž�����")
if dropkan <= 1 then --�Ǿ͵�����
	�����Ž�()
else
	dropkan=dropkan-�������(1)
	������() �����Ž�() �����Ž�() �Ž����ƴ���()
end
end
function Dcg(n1,n2)  --�Ӳ���
local ln1=n1
local ln2=n2

-- pagedelaylv

if not ������(ln1) then Win.Print("����������ʧ��") return false end

setLv(pagedelaylv)
����Ϊnew����()
tc(FExs[4],pagey)
ln2=emptyn()+ln2
ѡ��ҳ(ln2)
ҳ��ѡ��(ln2)
popLv()

waitsta(611,415,6646383)
Base.Sleep(100)
if not Base.IsColor(678,452,7171615) then 
	if ln1==1 and not dcgloop then 
		local ti=n2+1 --����һ�����ԣ����Ƿ�����ͬһ�������ʧ��
		tc(162,301) tc(162,301)
		waitsta(410,215,5870139)
		dcgloop=true
		while (Dcg(1,ti)==false) and (ti-ln2)<4 do  --ѭ������4��
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
	Win.Print("����������ʧ��")
	dcgloop=false
	return false
	else
	Win.Print("����������ʧ��")
	--backhome()
	return false
	end
end
Base.ClickRect(686,446)
waitsta(782,112,7105552)
Win.Print("����:���һ��")
return true
end
function cg(n1,n2)
������()
local rt=Dcg(n1,n2)
backhome()
return rt
end
  
function cgb(g)  -- ��ʽg={{n1,n2},{n1,n2},...}
������()
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
Win.Pop("����:�����������!",true)
return true
end

function cgall(g,kannum)  --g={n2,n2,n2.������}
������()
selectKantai(kannum)
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----���潢���
	Base.Sleep(1000)
end
local i,n1,n2,rt
i=1
while g[i]~=nil do
	n1=i
	n2=g[i]
	rt=Dcg(n1,n2)
	if not rt then backhome() Win.Print("cgall:����ʧ��")  return false end
	i=i+1
end
backhome()
Win.Print("cgall:�����������!")
return true
end

function cgInGroupsPreviousVersion()  --cgInGroups��ǰ�İ汾
--[[
ʹ��changekanǰ����
kana={[0]=7,20,81,83,14,22,40,39,72,73,25,36} --����
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

������()
for pi=0,#cgp do
	for pn=1,ncg do
	scg=Dcg(cgp[pi],kana[cgsta[pi]])
	cgsta[pi]=(cgsta[pi]+1)%ncg
	if scg==true then break end
	end
	if not scg then Win.Print("����:ʧ��") return false end
end
backhome()
return true
end

function ini()
if inied then return false end
inied=true
--��changekan()ʹ��ǰ�������һ��
for keyg,group in pairs(groups) do  			--��ÿ������м��
	theNumOfPostionsBelong2group=0
	for keys,cgsta in pairs(cgstas) do		--�ȼ������group�ж��ٸ�λ����ʹ��
		if cgsta[1]==keyg then theNumOfPostionsBelong2group=theNumOfPostionsBelong2group+1 end
	end
	local firstpos=999
	local order=-1
	for keys,cgsta in pairs(cgstas) do		--�ҵ���һ��ʹ�����group��λ��,��Ŵ�����ʼ����
		if cgsta[1]==keyg and keys<firstpos then firstpos=keys order=cgsta[2] end
	end
	for keys,cgsta in pairs(cgstas) do		--�������
		if cgsta[1]==keyg and keys~=firstpos then 
			cgsta[2]=(order-1+math.modf((#groups[cgsta[1]])/theNumOfPostionsBelong2group))%(#groups[cgsta[1]])+1   --�����ؾ��Ȼ���
			order = cgsta[2] --����order�����´μ���
		end
	end
end
end

function cgInGroups()
ini()
if cgen~=1 then return false end

local cgp       --λ��
local cgn		--���
local scg		--�ɹ�ʧ���ж�
������()
for key,cgsta in pairs(cgstas) do
	cgp=key
	for mtry=1,#groups[cgsta[1]] do
		cgn=groups[cgsta[1]][cgsta[2]]
		scg=Dcg(cgp,cgn)
		cgsta[2]=(cgsta[2])%(#groups[cgsta[1]])+1
		if scg==true then break end
		tc(201,263) waitsta(713,449,8898001) tc(211,269) waitsta(795,458,14147559)
	end
	if not scg then Win.Print("cgInGroups:ʧ��") return false end
end
backhome()
Win.Print("cgInGroups:�����������!")
return true
end

function cgallbutflag(g,kannum)        --�滻�����콢֮��Ĵ�
������()
selectKantai(kannum)
while not Base.IsColor(587,189,4540233) do
    Base.ClickRectEx(417,118,20,2) ----���潢���
	Base.Sleep(1000)
end
local i,n1,n2,rt
i=1
while g[i]~=nil do
	n1=i+1
	n2=g[i]
	rt=Dcg(n1,n2)
	if not rt then backhome() Win.Print("cgallbutflag:����ʧ��") return false end
	i=i+1
end
backhome()
Win.Print("cgallbutflag:�����������!")
return true
end