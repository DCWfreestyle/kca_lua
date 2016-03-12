require("\\Lua\\changebynew")
require("\\Lua\\Battle")
require("\\Lua\\¹¤¾ß")

--table_print(_G)table.insert(m_flash_kan,{name="ÇýÖð½¢´ó³±", min_lv=1, max_lv=11,  count=1});

function MCLK(x,y)
local lp=x+y*65536
Base.PostMessage(513,0,lp)
Base.PostMessage(514,0,lp)
end

function tl()
local scancode=1258291200
Base.SendMessage(256,37,scancode+3221225473)
Base.SendMessage(257,37)
end


local function CheckClickCount(_count)
	a = (_count - _count % 100) / 100
	b = ((_count % 100) - (_count % 100) % 10) / 10 - 1
	c = _count - a*100 - b*10 - 10
	return a,b,c
end

function setResource(È¼ÁÏ,µ¯Ò©,¸Ö²Ä,ÂÁ²Ä)

	a,b,c = CheckClickCount(È¼ÁÏ)
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
	
	a,b,c = CheckClickCount(µ¯Ò©)
	
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
	
	a,b,c = CheckClickCount(¸Ö²Ä)
	
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
	
	a,b,c = CheckClickCount(ÂÁ²Ä)
	
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
end
p(Base.GetColor(324,129,1607462))