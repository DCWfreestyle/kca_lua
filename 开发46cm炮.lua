--����ű�
--�Զ���ű�����
--ִ��3�ο���

ȼ�� = 10
��ҩ = 251
�ֲ� = 250
���� = 10

ִ�д��� = 3
--�����ֵ�޸ĳ��Լ���Ҫ��

Base.SetConfig("Sleep+?",100)

function IsColorAll(array) --�뱣�����������Ҫ�޸�
	n=0
	ok=0
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

function IsFactory() --�ɹ���KanAutoר��ȡɫ�������ɣ��뵽��̳����
    array = {};count = {};
    array = {[0]=291,246,3492493}; count[0] = array;
    array = {[0]=200,265,3029879}; count[1] = array;
    array = {[0]=202,238,3363487}; count[2] = array;
    array = {[0]=265,334,5016925}; count[3] = array;
    return IsColorAll(count)
end

function IsCreateItem() --�ɹ���KanAutoר��ȡɫ�������ɣ��뵽��̳����
    array = {};count = {};
	
    array = {[0]=766,430,11841058}; count[0] = array;
    array = {[0]=642,457,7569419}; count[1] = array;
    array = {[0]=633,441,9211425}; count[2] = array;
    array = {[0]=701,443,14277720}; count[3] = array;

    return IsColorAll(count)
end

function CheckClickCount(_count)
	a = (_count - _count % 100) / 100
	b = ((_count % 100) - (_count % 100) % 10) / 10 - 1
	c = _count - a*100 - b*10 - 10
	return a,b,c
end



--�ű������￪ʼ����ִ��

Kan.WaitHomeEx(2000,120*1000) --�ȴ�ĸ��

Base.ClickRect(281,358) --�������
Base.Sleep(1000)

m_count = 0

while true do
	Base.Print("�ȴ���������...")
	while IsFactory() == false do --�ȴ�������������
		Base.ClickRectEx(328,447) --����ײ� ���˵�
		Base.Sleep(1000)
	end
	Base.Sleep(500)
	
	Base.ClickRectEx(252,340) --���������ť
	
	Base.Print("�ȴ���������...")
	while IsCreateItem() == false do --�ȴ���������
		Base.Sleep(1000)
	end

	Base.Sleep(500)

	

	--������ϵ��
	Base.Print("���ò�������...")
	
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
	
	Base.Print("���������ɣ�")
	Base.ClickRectEx(707,444,80,30)

	
	m_count=m_count+1
	if m_count == ִ�д��� then Base.Print("�����ﵽ"); break; end --�ﵽ���� ����ѭ��
	
	Base.Sleep(1500)

end
Base.Click(589,285)
Kan.GoHome()
Base.Print("�ű�����") 
