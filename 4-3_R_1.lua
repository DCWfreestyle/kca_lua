require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
--require("\\Lua\\changebynew")
require("\\Lua\\����Զ��")
local ����=1             --ѡ���Ƿ�������1�ǣ�0��
local ����ʱ��=9
local ���д���=10
--Զ��
k2_conquest = C.�L���x��������_ID2 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k3_conquest = C.�����o�l�΄�_ID5 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k4_conquest = C.�����������_ID6 --ָ��Զ�����ɲ鿴Զ��Ҫ��

--------��������ò��ù�
changekan4_3=false
men = 0 ------��������
number_of_tasks = 2 -------��������
task_id = 1		------����ID
local rfe=false
local cj_last_time = os.time()-1
--=====================
local ssta=1
local n=1
cg43={
[0]=function() return cgallbutflag({92,29,36,76,62}) end,  	--f1
function() return cgallbutflag({30,85,68,45,50}) end,		--f2
function() return cgallbutflag({87,27,22,19,34}	) end		--f3
}

function ��·�ж�(lastp)
-- J(ս��)=1  F(SS)=2 K(SS)=3 D(ss)=4 G(��)=5 E(��)=6
	local xcrecorder=0
		Win.Print("��·�жϿ�ʼ")
	while xcrecorder<=1000 do
		if Base.IsColor(661,293,6416032) and lastp~=1 then return 1 end
		if Base.IsColor(547,279,6086807) and lastp~=2 then return 2 end
		if Base.IsColor(566,366,6218393) and lastp~=3 then return 3 end
		if Base.IsColor(477,238,16775936)and lastp==2 then return 4 end
		if Base.IsColor(400,182,16775936)and lastp~=5 then return 5 end --·��
		if Base.IsColor(353,120,16775936)and lastp~=6 then return 6 end --·��
		if ����() then ���̴���() Win.Print("���̴������") end
		Base.Sleep(100)
		xcrecorder=xcrecorder+1
	end
end

function ����4_3()
Base.Click(645,223)
Base.Sleep(500)
if ���Գ���()==false then --���ܳ���������-1
	Win.Pop("���ܳ�����",true)
	return -1
end
Base.Sleep(3500)
Win.Print("����4-3��")
Base.ClickRectEx(626,448,25,20)

���̴���()
Go_On=true
point=0
mstr="START"
while Go_On==true do --�һ����Դ�
	point=��·�ж�(point) Win.Print("��·�жϽ���")
	if     point==1 then --j
		mstr=mstr.."-J"
		Win.Print(mstr)
		Go_On = Dս��(1,false,true)
	elseif point==2 then --f
		mstr=mstr.."-F"
		Win.Print(mstr)
		Go_On = Dս��(5,false,true)
	elseif point==3 then --k
		mstr=mstr.."-K"
		Win.Print(mstr)
		Go_On = Dս��(5,false,false)
		return 0
	elseif point==4 then --d
		mstr=mstr.."-D"
		Win.Print(mstr)
		if ���� == 1 then
			Go_On = Dս��(5,false,true)
		else 
			Go_On = Dս��(5,false,false)
			return 0
		end
	elseif point==5 then --g
		mstr=mstr.."-G"
		Win.Print(mstr)
		Win.Pop("���ˣ���ˢ��",true)
		return -10
	elseif point==6 then --e
		mstr=mstr.."-E"
		Win.Print(mstr)
		Dս��(1,false,false) --����
		return 0
	end
	Base.Sleep(100)
end
Win.Print("�������д��Ʒ���")
return false

end


function �δ�4_3T()
if n > ���д��� or (n~=1 and os.time()<cj_last_time+����ʱ��*60) then return end
	Win.Print(( "��ʼ��:%d��"):format(n))
	ret = ����.ִ��(true) --ֻ��������1

	if ret > 0 then
		while ret~=0 do
			Win.Pop('���ƻ����ƣ�',true)
			Kan.RepairEx(1,12,12)
			ret = ����.ִ��(true)
		end
	elseif ret == -1 then
			Win.Pop('�������� �ű�ֹͣ��',true)
		n=���д���+2
	elseif ret == -2 then
			Win.Pop('Զ���� �ű�ֹͣ��',true)
		n=���д���+2
	end
	
	if changekan4_3 then 
		cg43[ssta]()--����
		ssta=(ssta+1)%(#cg43+1)
		ret = ����.ִ��(true)
	end
	--------------------
	if ret==0 then 
		Kan.Sally(4,3)
		k=����4_3()
		if k==-10 then 
			ˢ����Ϸ()   --�Զ�ˢ��
		end
		n=n+1
		cj_last_time = os.time()
	end
	-------------------------
	ͨ��.�ȴ�ĸ��(1500)
	Base.Sleep(2000)
	if n>���д��� then
		����.ִ��(true)
		Win.Pop('����ִ����ϣ�')
	end
end
while true do 
	�δ�4_3T()
	����һ��Զ��()
	Base.Sleep(1000*2)
end