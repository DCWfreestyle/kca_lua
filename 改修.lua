gx=23   -----------喂几个
mpt=3                -------------- 一次改多少个 0到5之间
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
function 取整(x)
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
function 选择被点开()

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
function 在改修()

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
function 归()

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
function 改修i(n)
if 选择被点开() == true then
Base.Click(170,250)
Base.Sleep(500)
end
if 在改修()==false then
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

if n>0 then                   --------改修start
Base.Sleep(1000) 
Base.Click(697,444)
Base.Sleep(500) 
Base.Click(485,404)

while 归() == false do
	Base.Sleep(300)
end
Base.Click(403,204)
while 在改修() == false do
	Base.Sleep(300)
end
end
end
----------------------------------------------
function 改修(p)
p=p or 5
xh=p/mpt
xh = 取整(xh)
mk = p-xh*mpt
while xh >0 do
	改修i(mpt)
	xh=xh-1
end
改修i(mk)
end
---------------------------------------------
改修(gx)