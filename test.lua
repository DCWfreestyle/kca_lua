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
ret = Base.CallFunc("Base.FindColorExAll","[0,3355443,3355443,12896206,15922943,15922943,14738668,4539975,3355443,3355443,3355443]")
--会返回所有符合位置的坐标
--第一个参数是误差值0-255 建议在<10

if ret ~= nil then --没有找到的话 返回值为nil 需要判断 否则出错
        --下面我们处理一下返回的字符串 将他们放到table中
        t = {}
        for k, v in string.gmatch(ret, "(%d+),(%d+)") do    
                table.insert(t,{x=k,y=v}) 
                --在表中插入一个坐标 当然也可以在这里直接使用
        end 
 
        Base.Print("-----")
        --输出坐标
        for key, value in pairs(t) do  
                Base.Print(string.format("%d,%d",value["x"],value["y"]))
        end  
end