require("\\Lua\\changebynew")
require("\\Lua\\Battle")
require("\\Lua\\����")

--table_print(_G)table.insert(m_flash_kan,{name="���𽢴�", min_lv=1, max_lv=11,  count=1});

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
--�᷵�����з���λ�õ�����
--��һ�����������ֵ0-255 ������<10

if ret ~= nil then --û���ҵ��Ļ� ����ֵΪnil ��Ҫ�ж� �������
        --�������Ǵ���һ�·��ص��ַ��� �����Ƿŵ�table��
        t = {}
        for k, v in string.gmatch(ret, "(%d+),(%d+)") do    
                table.insert(t,{x=k,y=v}) 
                --�ڱ��в���һ������ ��ȻҲ����������ֱ��ʹ��
        end 
 
        Base.Print("-----")
        --�������
        for key, value in pairs(t) do  
                Base.Print(string.format("%d,%d",value["x"],value["y"]))
        end  
end