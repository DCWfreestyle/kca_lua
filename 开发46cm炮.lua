--舰娘脚本
--自定义脚本例子
--执行3次开发

燃料 = 10
弹药 = 251
钢材 = 250
铝材 = 10

执行次数 = 3
--上面的值修改成自己需要的

Base.SetConfig("Sleep+?",100)

function IsColorAll(array) --请保持这个函数不要修改
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

function IsFactory() --由工具KanAuto专用取色工具生成，请到论坛下载
    array = {};count = {};
    array = {[0]=291,246,3492493}; count[0] = array;
    array = {[0]=200,265,3029879}; count[1] = array;
    array = {[0]=202,238,3363487}; count[2] = array;
    array = {[0]=265,334,5016925}; count[3] = array;
    return IsColorAll(count)
end

function IsCreateItem() --由工具KanAuto专用取色工具生成，请到论坛下载
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



--脚本从这里开始向下执行

Kan.WaitHomeEx(2000,120*1000) --等待母港

Base.ClickRect(281,358) --点击工厂
Base.Sleep(1000)

m_count = 0

while true do
	Base.Print("等待工厂界面...")
	while IsFactory() == false do --等待工厂界面载入
		Base.ClickRectEx(328,447) --点击底部 过滤掉
		Base.Sleep(1000)
	end
	Base.Sleep(500)
	
	Base.ClickRectEx(252,340) --点击开发按钮
	
	Base.Print("等待开发界面...")
	while IsCreateItem() == false do --等待开发界面
		Base.Sleep(1000)
	end

	Base.Sleep(500)

	

	--计算材料点击
	Base.Print("设置材料数量...")
	
	a,b,c = CheckClickCount(燃料)
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
	
	a,b,c = CheckClickCount(弹药)
	
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
	
	a,b,c = CheckClickCount(钢材)
	
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
	
	a,b,c = CheckClickCount(铝材)
	
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
	
	Base.Print("给我力量吧！")
	Base.ClickRectEx(707,444,80,30)

	
	m_count=m_count+1
	if m_count == 执行次数 then Base.Print("次数达到"); break; end --达到次数 跳出循环
	
	Base.Sleep(1500)

end
Base.Click(589,285)
Kan.GoHome()
Base.Print("脚本结束") 
