require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
require("\\Lua\\changebynew")
require("\\Lua\\����Զ��")       --����һ��Զ��()
local ����=1             --ѡ���Ƿ�������1�ǣ�0��
local ����ʱ��=0
local ���д���=10
--Զ��
k2_conquest = C.�L���x��������_ID2 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k3_conquest = C.�����o�l�΄�_ID6 --ָ��Զ�����ɲ鿴Զ��Ҫ��
k4_conquest = C.�����������_ID5 --ָ��Զ�����ɲ鿴Զ��Ҫ��
--------��������ò��ù�
changekan4_3=true
men = 0 ------��������
number_of_tasks = 2 -------��������
task_id = 1		------����ID
local rfe=false
local cj_last_time = os.time()
--=====================
local ssta=0
local n=1
cg43={
[0]=function() return cgallbutflag({92,118,36,62,76}) end,  	--��
function() return cgallbutflag({51,85,68,50,45}) end,		--����
function() return cgallbutflag({87,27,22,34,19}	) end		--ľ��
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

function �δ�4_3()
while n <= ���д��� do --ѭ������
	Win.Print(( "��ʼ��:%d��"):format(n))
��ʼռ��() --########################################
	ret = ����.ִ��(true) --ֻ��������1

	if ret > 0 then
        --����.ִ��(1)
		while ret~=0 do
			Win.Pop('���ƻ����ƣ�',true)
			Kan.RepairEx(1,12,12)
			ret = ����.ִ��(true)
		end
	elseif ret == -1 then
		--����
			Win.Print('�������� �ű�ֹͣ��')
			Win.Pop('�������� �ű�ֹͣ��')
		n=���д���+2
	elseif ret == -2 then
		--����
			Win.Print('Զ���� �ű�ֹͣ��')
			Win.Pop('Զ���� �ű�ֹͣ��')
		n=���д���+2
	end
	
	if ret==0 and n~=1 and ����ʱ��>0 then 
		����ex(1000*60*����ʱ��) --
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
	end
	-------------------------
	
	ͨ��.�ȴ�ĸ��(1500)
	
	Base.Sleep(2000)
����ռ��()--###########################
if men==0 then ����һ��Զ��() end
end
����.ִ��(true)
if rfe then Release() end
Win.Pop('�ű�ִ����ϣ�')
end

function �δ�4_3T()
if n > ���д��� or os.time()<cj_last_time+����ʱ�� then return end
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
		Win.Pop('�ű�ִ����ϣ�')
	end
end
--�δ�4_3()
while true do
�δ�4_3T()
����һ��Զ��()
Base.Sleep(1000*2)
end