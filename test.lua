require("\\Lua\\changebynew")
require("\\Lua\\Battle")
require("\\Lua\\工具")

--table_print(_G)table.insert(m_flash_kan,{name="驱逐舰大潮", min_lv=1, max_lv=11,  count=1});

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


Kan.AddKanChangeName("潜水舰马路油", 1, 30,  true, 0, 4);
tl(1,23)