--ͨ��.�ص�ĸ��()
function IsColorAll(array)
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

function ����Ƿ���ĸ��()

	array = {}
	count = {}

	array = {[0]=204,247,2137083}
	count[0] = array

	array = {[0]=204,247,2137083}
	count[1] = array

	array = {[0]=204,247,2137083}
	count[2] = array
	
	return IsColorAll(count)

end

function ����Ƿ��ڱ��()
	array = {}
	count = {}
	
array = {[0]=75,390,5790756}
count[0] = array
array = {[0]=89,190,5862711}
count[1] = array
array = {[0]=475,112,12503936}
count[2] = array
array = {[0]=279,104,13423578}
count[3] = array
array = {[0]=239,466,13684097}
count[4] = array
array = {[0]=297,468,12900569}
count[5] = array
array = {[0]=741,222,6459708}
count[6] = array
array = {[0]=401,332,4224543}
count[7] = array

	return IsColorAll(count)
end

function �����Ž�()
for n=0,0 do
	if ����Ƿ���ĸ��() == false then
	    ͨ��.�ص�ĸ��()
	    ͨ��.�ȴ�ĸ��(1500)
	end
	Base.Click(203,135)
	Base.Sleep(1000)
	if ����Ƿ��ڱ��() == true then
      	    break
	else
	    ͨ��.�ص�ĸ��()
	    ͨ��.�ȴ�ĸ��(1500)
	end
end
if ����Ƿ��ڱ��() == true then
      	Base.Click(740,216) --������
	Base.Sleep(500)
	Base.Click(420,138)
	Base.Sleep(1500)
	if ����Ƿ���ĸ��() == false then
	    ͨ��.�ص�ĸ��()
	end
end
end
�����Ž�()