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
function tc(a,b)
	Base.Click(a,b)
	Base.Sleep(700)
end
