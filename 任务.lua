include_���� = true
require("\\Lua\\����")
--������Դ��������0ʱ��Ч
ȼ�� = 10
��ҩ = 251
�ֲ� = 250
���� = 10

���Ӵ�����="[0,145,10464953,7700359,12900324,12834532,12834532,12834531,6252397,12966117,12966117,7502979,11781584,12966118,5462623,12768738,12768739,7700358,10925504,6383983,8358803,9411749,7371136,8556182,12966117,12966117,8227217,12176343,8029581,10728125,8885147,10135730,13163496,11583949,7568773,12702945,10070193,6449776,9543592,10860224,7503236,12702688,7502979,12768481,6581363,12966117,12900324,12768738,6318447,13031910,13097703,7502979]"

����1="[0,145,11649742,5594209,13097703,13097703,5462367,11913170,13031910,13031910,11978707,11847121,11781328,11649742,9938608,5528416,6976377,10925504,11912914,11978452,11846867,11846867,11846867,12900070,12900070,8885149,8950686,10004146,8358291,9740973,8095631,8292498,7963789,8292754,8358547,7174014,10859967,13097703,13031910,12900324,12834787,12834531,12900580,12966117,12966373,13097703,6910584,13031910,13097703,13031910,13032166,13031910]"

����1="[0,145,12900068,7239807,11583948,13031910,5725796,12176344,12505309,4738385,12966118,12966118,12966117,12900324,12900325,13031654,13097704,13031910,10794175,11978965,5067351,11913171,12966117,10135987,7107964,12768485,12768485,12834278,12768228,12768228,11583438,7831946,8555928,11517902,7766153,8753563,10925506,12702691,5923432,6120555,12175833,12834275,12834275,12965861,12966118,12965861,12965861,12834532,12900068,12900324,12834532,12768739]"
����3=
"[0,145,12373466,4804435,12373466,12439258,12505051,12439514,12307929,13031909,13097702,10728124,6778998,13294825,13294825,13360618,10991297,5923174,13097446,13097446,13097446,13163239,4475213,12768737,13163496,6910585,7766152,7766152,7766151,12307672,5396830,12505052,12505052,6054761,11517898,12505309,8095373,9806508,13163239,6647156,8621975,6647155,10530488,13097446,13097446,5067607,6844792,10596281,13163239,13229032,13163494,12966116]"

����3=
"[0,145,8753562,11781327,7832202,8885147,11122883,13097446,6054761,6186604,12439515,13097702,13229288,13163495,8358802,9675178,8753305,9674921,8950684,8950941,8885147,8884891,6515570,6778742,9016477,8950941,8950941,13163239,9872301,9279906,9214113,5725795,11254469,6383983,4475213,5594209,5133401,5857381,6450033,7108220,8226960,13031653,13031653,13097446,6778742,9477542,13031653,13229032,5067607,11978707,13031653,12965860]"
����=
"[0,145,12900324,5660003,11452105,6647155,9543079,12900068,11188677,6186603,9411750,13031910,13031910,12505309,13031911,12966118,4541006,13031910,5396830,8819355,8885147,5989224,8885148,8885147,7963787,9740972,13097959,13163496,13097959,6647412,10530745,13097703,13163496,5067607,11978707,13097703,13032166,12966117,12966117,12900324,12966117,13097703,13097703,13097703,13163496,13097703,12900324,12966117,12966117,13031910,13032166,13031910]"
��=
"[0,145,11912658,5594210,8095374,8095118,8029582,5528416,8029581,8095374,8095630,4870228,13032166,12966117,12571102,8424596,5725795,7108220,6383983,6647412,7963788,6515826,11978707,7502980,6581620,7502724,7437187,10530491,12834277,8160912,7108221,9411751,11912916,13031656,11254729,5528416,12702691,12768484,11188679,8819357,6844791,9938351,12900322,9740715,5330780,8556182,8029580,7437186,5264987,12965860,8095374,8556182]"

������3="[0,145,6318190,12900580,6449776,6318190,6318190,5330780,6318190,6317934,6252398,9674924,12702692,12702691,9938353,5264988,9872303,11452108,6647413,7897996,11188936,11254729,11254728,11386059,8885148,5330780,12505309,11649997,7897995,8029581,11518156,7766152,8885147,7897994,7897994,5725796,11912913,13163496,13163496,13097703,12834531,12900324,12900324,12900324,5528416,10530746,12966117,12966117,13229289,13097959,12966117,12900324 ]"
������5= "[0,145,11320776,8490133,10925760,7108220,9543081,10464954,9082785,10003889,13031656,12965863,12900326,4870228,12768484,12900070,12768484,9016992,6318191,10728127,5396830,11715281,12900324,12966117,13163496,13032166,5791588,12044756,8621975,10201779,8358803,10464696,7568773,13031910,13031910,13097703,6581619,11123139,12966373,10201523,7568773,13031910,13031910,13031910,6515826,10991554,10267573,7832201,12966117,12966117,5133401,12307929 ]"


maxfactory=3

local function �������(n)  --������dy=78
return Base.IsColor(433,228+(n-2)*78,10460707) 
end
function IsFactory() --�ɹ���KanAutoר��ȡɫ�������ɣ��뵽��̳����
    local array = {};local count = {};
    array = {[0]=291,246,3492493}; count[0] = array;
    array = {[0]=200,265,3029879}; count[1] = array;
    array = {[0]=202,238,3363487}; count[2] = array;
    array = {[0]=265,334,5016925}; count[3] = array;
    return IsColorAll(count)
end
local function ��ɴ���()
	while IsFactory() == false do --�ȴ�������������
		Base.ClickRectEx(328,447) --����ײ� ���˵�
		Base.Sleep(1000)
	end
end

local function �����(n)
return Base.IsColor(485,191+(n-1)*78,12107468)
end

-- ��Դѡ�� 325,129,5219417
local function �����һ��������() --���ؿյ�λ��
for i=1,maxfactory do
	if �����(i) then return i end
end
for i=1,maxfactory do
	if �������(i) then
		p("GET",i)
		Base.Click(617,257+((i-2)*78) )
		while �������(i) do
			Base.Sleep(500)
		end
		��ɴ���()
		return i
	end
end

tc(740,184)
waitsta(480,382,10460707)  --�����Ҫ
Base.Sleep(1000)
Base.Click(480,382)
waitsta(447,144,11974258)
Base.Sleep(1000)
return �����һ��������()
end
function ����(n) --30 30
n=n or 1
GoFactory()
while n>0 do
	local i=�����һ��������()
	if i==false then p("���죺 �쳣 1")  return false  end --�쳣
	tc(615,179+(i-1)*78)
	Base.ClickRectEx(707,444,80,30)
	��ɴ���()
	n=n-1
end
backhome()
end

function ��ս�����() --30 30
local n=maxfactory
GoFactory()
for i=1,maxfactory do
	if �������(i) then
		p("GET",i)
		Base.Click(617,257+((i-2)*78) )
		while �������(i) do
			Base.Sleep(500)
		end
		��ɴ���()
	end
end
backhome()
end

local function CheckClickCount(_count)
	a = (_count - _count % 100) / 100
	b = ((_count % 100) - (_count % 100) % 10) / 10 - 1
	c = _count - a*100 - b*10 - 10
	return a,b,c
end

function setResource(ȼ��,��ҩ,�ֲ�,����)
	if not (ȼ��>0 and ��ҩ>0 and �ֲ�>0 and ����>0) then return false end
	a,b,c = CheckClickCount(ȼ��)
	if a ~= 0 or  b ~= 0 or c ~= 0 then
		for n=1,a do
			Base.Click(490,163) --a
			Base.Sleep(100,true)
		end
		Base.Sleep(300,true)
		
		if b < 0 then 
			for n=1,math.abs (b) do
				Base.Click(437,136) --b
				Base.Sleep(100,true)
			end
		else
			for n=1,b do
				Base.Click(489,136) --b
				Base.Sleep(100,true)
			end
		end
		
		Base.Sleep(300,true)
		for n=1,c do
			Base.Click(361,156) --c
			Base.Sleep(100,true)
		end
	
	end
	
	a,b,c = CheckClickCount(��ҩ)
	
	if a ~= 0 or  b ~= 0 or c ~= 0 then
		for n=1,a do
			Base.Click(489,293) --a
			Base.Sleep(100,true)
		end
		Base.Sleep(300,true)
		if b < 0 then 
			for n=1,math.abs (b) do
				Base.Click(437,267) --b
				Base.Sleep(100,true)
			end
		else
			for n=1,b do
				Base.Click(490,267) --b
				Base.Sleep(100,true)
			end
		end
		Base.Sleep(300,true)
		for n=1,c do
			Base.Click(361,285) --c
			Base.Sleep(100,true)
		end
	end
	
	a,b,c = CheckClickCount(�ֲ�)
	
	if a ~= 0 or  b ~= 0 or c ~= 0 then
		for n=1,a do
			Base.Click(718,163) --a
			Base.Sleep(100,true)
		end
		Base.Sleep(300,true)
		
		if b < 0 then 
			for n=1,math.abs (b) do
				Base.Click(665,136) --b
				Base.Sleep(100,true)
			end
		else
			for n=1,b do
				Base.Click(718,136) --b
				Base.Sleep(100,true)
			end
		end
		
		Base.Sleep(300,true)
		for n=1,c do
			Base.Click(589,155) --c
			Base.Sleep(100,true)
		end
	end
	
	a,b,c = CheckClickCount(����)
	
	if a ~= 0 or  b ~= 0 or c ~= 0 then
		for n=1,a do
		Base.Click(717,294) --a
			Base.Sleep(100,true)
		end
		Base.Sleep(300,true)
		if b < 0 then 
			for n=1,math.abs (b) do
				Base.Click(665,266) --b
				Base.Sleep(100,true)
			end
		else
			for n=1,b do
				Base.Click(718,266) --b
				Base.Sleep(100,true)
			end
		end
		Base.Sleep(300,true)
		for n=1,c do
			Base.Click(589,285) --c
			Base.Sleep(100,true)
		end
	end
	Base.Sleep(500,true)
end

local function ����(n) --10 10
n=n or 1
local isfirst = true
Kan.WaitHome()
GoFactory()
while n>0 do
	tc(213,335)
	waitsta(318,128,555542)
	if isfirst then setResource(ȼ��,��ҩ,�ֲ�,����) isfirst=false end
	Base.ClickRectEx(707,444,80,30)
	��ɴ���()
	n=n-1
end
backhome()
end
local function IsHome()
	return ����Ƿ���ĸ��()
end

local function IsMission()
    local array = {};local count = {};
    array = {[0]=717,464,14477808}; count[0] = array;
    array = {[0]=695,457,14675187}; count[1] = array;
    return IsColorAll(count)
end

local function IsMission2()
   local array = {};local count = {};
	
    array = {[0]=95,463,6973993}; count[0] = array;
    array = {[0]=21,463,7434542}; count[1] = array;
    array = {[0]=64,468,4605510}; count[2] = array;

    return IsColorAll(count)
end


function CheckMyMission(name)
	--�������
	local ret = Base.CallFunc("Base.FindColorExAllBin", name)
	
	
	Base.Print(ret)

	if ret ~= nil then
		--�������Ǵ���һ�·��ص��ַ��� �����Ƿŵ�table��
		local t = {}
		for k, v in string.gmatch(ret, "(%d+),(%d+)") do    
			table.insert(t,{x=k,y=v}) --�ڱ��в���һ������ ��ȻҲ����������ֱ��ʹ��
		end  
		Base.Print("-----")
		--�������
		for key, value in pairs(t) do  
			Base.Print(string.format("%d,%d",value["x"],value["y"]))
		end  
		--Base.Print(#t)
		--�ҵ���������������0�������һ������
		if #t > 0 then
			Base.Print("���")
			Base.Click(t[1].x,t[1].y)
			waitstaR(149,474,13822963)
			waitsta(149,474,13822963)
			return true;
		end
	end
	
	return false;
end
function ������(names)
	if type(names) ~= "table" then
		names={names}       --���첻��list�����
	end
	
    ͨ��.�ȴ�ĸ��(1000)
    Base.Click(555,51) --���ĸ������
	while IsMission() == false do --�ȴ����������ȫ����
		Base.ClickRectEx(695,457) --������
		Base.Sleep(1000)
	end

	Base.Sleep(1000)
	
	Base.Click(651,460) --���������һҳ
	
	waitsta(247,461,10592291)
	Base.Print("�������")
	local removenames
	p(Base.IsColor(247,461,10592291))
	while Base.IsColor(247,461,10592291) do --�������ǰ��ҳ�ļ�ͷ �ͽ���ѭ��
		
		waitsta(92,463,7171374)
		Base.Sleep(500)
		removenames={}
		for k,name in ipairs(names) do  --����ʹ��pairs
		  if CheckMyMission(name) == true then --�ҵ��������겢���
		  	waitsta(396,401,10460707)
			Base.Sleep(1000)
			tc(399,400)
			waitsta(92,463,7171374)
			table.insert(removenames,name)  --��¼ɾ��
			Win.Print("�յ�����"..name)
		  end
		end
		
		for k,name in ipairs(removenames) do
			table.remove(names,k)    --����ɾ��
		end
		
		if #names == 0 then
			break
		end
		Win.Print("��ҳ")
		Base.Sleep(1000)
		Base.Click(297,463) --��ǰ��ҳ
		Base.Sleep(1000) --����ȴ�һ�� �����෭һҳ
	end
	backhome()
	Win.Print("���")


end

function ������b(names)   --������������������list
	if type(names) ~= "table" then
	names={names}       --���첻��list�����
	end
	--p(names[1])
    ͨ��.�ȴ�ĸ��(1000)
    Base.Click(555,51) --���ĸ������
	while IsMission() == false do --�ȴ����������ȫ����
		Base.ClickRectEx(695,457) --������
		Base.Sleep(1000)
	end

	Base.Sleep(1000)
	
	Base.Click(651,460) --���������һҳ
	
	waitsta(247,461,10592291)
	Base.Print("�������")
	local removenames
	while Base.IsColor(247,461,10592291)  do --�������ǰ��ҳ�ļ�ͷ �ͽ���ѭ��
		waitsta(92,463,7171374)
		Base.Sleep(500)
		removenames={}
		
		for k,name in ipairs(names) do  --����ʹ��pairs
		  p(name)
		  if CheckMyMission(name) == true then --�ҵ��������겢���
			table.insert(removenames,name)  --��¼ɾ��
			Win.Print("�ӵ�����"..name)
		  end
		end
		
		for k,name in ipairs(removenames) do
			table.remove(names,k)    --����ɾ��
		end
		
		if #names == 0 then
			break
		end
		
		Win.Print("��ҳ")
		Base.Sleep(1000)
		Base.Click(297,463) --��ǰ��ҳ
		Base.Sleep(1000) --����ȴ�һ�� �����෭һҳ
	end
	backhome()
	Win.Print("���")

end
--CheckMyMission(����1)
��ս�����()
--[[ ]]
������b(����1)
����(1)
������(����1)
������b(����1)
����(1)
������(����1)
������b(����3)
����(3)
������(����3)

--��ս�����()
--[[ 
����(3)
������(����3)
������b({����,��})

������b(��)
new����(2)
]]
--����
