require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
Manual_Refresh=1           ---�ֶ�ˢ�£�1Ϊ�ֶ� ��0�Զ�
rfe=1
function ��·�ж�(lastp)
-- ��ȷ=1  ��=2
	while true do
		if Base.IsColor(661,293,6416032) and lastp~=1 then return 1 end
		if Base.IsColor(547,279,6086807) and lastp~=2 then return 2 end
		Base.Sleep(100)
	end
end

function ����51()
if ���Գ���()==false then --���ܳ���������-1
	Win.Pop('���ܳ�����')
	Win.Print('���ܳ�����')
	return -1
end
Base.Sleep(3300)
tc(628,442)               --��һ����
Win.Print('��һ����5-1����')
Base.Sleep(3000)
while ������()==false do Base.Sleep(300) end
Base.Sleep(3000)
ѡ������()
if ��·�ж�(0)==2 then
	return -10 -----·�ߴ���!
end
Win.Print('��·��ȷ')
Base.Sleep(700)
Dս��(5,false,false)
return 0
end

function �δ�5_1()
for n = 0, 100 do --ѭ������
	
	a = "��ʼ��:%d��"
	Win.Print(a:format(n))

	ret = ����.ִ��() --ֻ��������1

	if ret > 0 then
                                          ����.ִ��(1)
			Win.Print('��������')
			Win.Pop('��������')

		break
	elseif ret == -1 then
		--����
			Win.Print('�������� �ű�ֹͣ��')
			Win.Pop('�������� �ű�ֹͣ��')
		break
	elseif ret == -2 then
		--����
			Win.Print('Զ���� �ű�ֹͣ��')
			Win.Pop('Զ���� �ű�ֹͣ��')
		break
	end


	--------------------    5-1����
	����.ִ��(5,1)
	k=0
	k=����51()
	if k==-10 then 
		ˢ����Ϸ()
	end
	-------------------------
	ͨ��.�ȴ�ĸ��(1500)
    math.randomseed(os.time())
	min = math.random(1,3) 
    if (n+1)%10 == 0 then 
        Base.Sleep(1000*60*min) --ͣ1���� 
    end
	Base.Sleep(2000)

end

Win.Pop('�ű�ִ����ϣ�')
end


�δ�5_1()
if rfe==1 then Release() end