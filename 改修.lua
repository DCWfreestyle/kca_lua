gx=23   -----------ι����
mpt=3                -------------- һ�θĶ��ٸ� 0��5֮��
----------------------------
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

----------------------------------------------
function ȡ��(x)
if x <= 0 then
   return math.ceil(x);
end

if math.ceil(x) == x then
   x = math.ceil(x);
else
   x = math.ceil(x) - 1;
end
return x;
end
---------------------------------------------
function ѡ�񱻵㿪()

	array = {}
	count = {}
	
array = {[0]=31,276,3314666}
count[0] = array
array = {[0]=23,275,3623}
count[1] = array
array = {[0]=754,452,6198885}
count[2] = array

	return IsColorAll(count)

end
---------------------------------------------
function �ڸ���()

	array = {}
	count = {}
	
array = {[0]=494,443,5341223}
count[0] = array
array = {[0]=710,199,3356214}
count[1] = array
array = {[0]=588,137,10328884}
count[2] = array
array = {[0]=722,267,4277316}
count[3] = array
array = {[0]=616,453,14477553}
count[4] = array

	return IsColorAll(count)

end

----------------------------------------------
function ��()

	array = {}
	count = {}
	
array = {[0]=744,441,12500030}
count[0] = array
array = {[0]=752,441,16250863}
count[1] = array
array = {[0]=769,443,15855840}
count[2] = array
array = {[0]=762,444,16250863}
count[3] = array
array = {[0]=765,439,12565565}
count[4] = array

	return IsColorAll(count)

end
----------------------------------------------
function ����i(n)
if ѡ�񱻵㿪() == true then
Base.Click(170,250)
Base.Sleep(500)
end
if �ڸ���()==false then
Base.Click(614,438)
Base.Sleep(3000) 
end
if n>0 then
Base.Sleep(1000) 
Base.Click(566,138)
Base.Sleep(500) 
Base.Click(579,140)
end

if n>1 then
Base.Sleep(1000) 
Base.Click(565,200)
Base.Sleep(500) 
Base.Click(579,140)
end

if n>2 then
Base.Sleep(1000) 
Base.Click(567,260)
Base.Sleep(500) 
Base.Click(579,140)
end

if n>3 then
Base.Sleep(1000) 
Base.Click(567,320)
Base.Sleep(500) 
Base.Click(579,140)
end

if n>4 then
Base.Sleep(1000) 
Base.Click(567,376)
Base.Sleep(500) 
Base.Click(579,140)
end

if n>0 then                   --------����start
Base.Sleep(1000) 
Base.Click(697,444)
Base.Sleep(500) 
Base.Click(485,404)

while ��() == false do
	Base.Sleep(300)
end
Base.Click(403,204)
while �ڸ���() == false do
	Base.Sleep(300)
end
end
end
----------------------------------------------
function ����(p)
p=p or 5
xh=p/mpt
xh = ȡ��(xh)
mk = p-xh*mpt
while xh >0 do
	����i(mpt)
	xh=xh-1
end
����i(mk)
end
---------------------------------------------
����(gx)