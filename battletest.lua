require("\\Lua\\changebynew")
require("\\Lua\\����Զ��")

include_�޴�=true
require("\\Lua\\��ʯ�޴�")

function 





end

function ����(�������� ) --table ����f ,����ս��f,����f,�ȴ�ʱ��,��������
if n=nil then --initial
    if ��������==nil or ��������.����ս��f ==nil or 
    n = 1
    ended=false
    local ret=0
end
if ended then return end
if n>��������.�������� then 
	ended=true
	if rep==1 then
	ȫ������()
	end
	����.ִ��(true)
	return
end
if ��������.�ȴ�ʱ��>0 and n>1 then
    if os.time()<cj_last_time+��������.�ȴ�ʱ��*60 then return end
end
Win.Print(("��:%d��"):format(n))
ret = ����.ִ��(true)
if ret~=0 then
    if type(��������.����f)=="function" then
        ��������.����f(ret)
    else 
        while ret~=0 do
            Win.Pop('���ƻ����ƣ�',true)
            Kan.RepairEx(1,12,12)
            ret = ����.ִ��(true)
        end
    end
end

ͨ��.�ȴ�ĸ��(1000)
f type(��������.����f)=="function" then
    ��������.����f() --TODO
end
ret = ����.ִ��(true)
if ret==0 then
	��������.����f("print_state")
	ͨ��.�ȴ�ĸ��(2000)
	k=��������.����ս��f()
    if k==-10 then 
        ˢ����Ϸ()   --�Զ�ˢ��
    end
	n=n+1
	cj_last_time = os.time()
end
ͨ��.�ȴ�ĸ��(2000)
end
function ����andԶ��(��������)
    while true do 
        ����(��������)
        ����һ��Զ��()
        Base.Sleep(1000*2)
    end
end