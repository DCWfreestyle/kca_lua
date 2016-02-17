start =1 --开始位置
fq =30  --废弃数量                  --任务24个
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

local function 检查是否废弃完成()

	array = {}
	count = {}
    array = {[0]=703,418,14609139}; count[0] = array;
	return IsColorAll(count)

end

local function 等待废弃完成()
while 检查是否废弃完成() == false do
	Base.Sleep(200)
end
end

function 废弃(s,p)
p = p or 1
s = s or 1
interval =  30    --间隔多少个像素点
offset = interval *(s-1)
纵坐标 = offset + 145 --真实像素点
横坐标 = 284
while p>0 do
	Base.Click(横坐标,纵坐标)
	Base.Sleep(500)
	Base.Click(699,430)
	等待废弃完成()
	p=p-1
end
Win.Pop('废弃作业完了')
Win.Print('废弃作业完了')
end

废弃(start,fq)
