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

a={{1,1}}
p(a[1][1])
for k,v in pairs(a) do
v[1]=55
end

p(a[1][1])