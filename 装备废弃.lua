start =1 --��ʼλ��
fq =30  --��������                  --����24��
local function IsColorAll(array)

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

local function ����Ƿ�������()

	array = {}
	count = {}
    array = {[0]=703,418,14609139}; count[0] = array;
	return IsColorAll(count)

end

local function �ȴ��������()
while ����Ƿ�������() == false do
	Base.Sleep(200)
end
end

function ����(s,p)
p = p or 1
s = s or 1
interval =  30    --������ٸ����ص�
offset = interval *(s-1)
������ = offset + 145 --��ʵ���ص�
������ = 284
while p>0 do
	Base.Click(������,������)
	Base.Sleep(500)
	Base.Click(699,430)
	�ȴ��������()
	p=p-1
end
Win.Pop('������ҵ����')
Win.Print('������ҵ����')
end

����(start,fq)
