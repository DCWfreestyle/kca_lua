require("\\Lua\\changebynew")
require("\\Lua\\����Զ��")

include_�޴�=true
require("\\Lua\\��ʯ�޴�")

function 





end

function ����(�������� ) --table ����f ,����ս��f,����f,�ȴ�ʱ��,��������,����f
--TODO:��μ���..
    if cjn=nil then --initial
        cjn = 1 --globa
        ended=false
        local ret=0
    end
    if ended then return end
    if (��������.��������>=1 and cjn>��������.��������) or (type(��������.����f)=="function" and ��������.����f()) then 
        ended=true
        if rep==1 then
        ȫ������()
        end
        ����.ִ��(true)
        return
    end
    if ��������.�ȴ�ʱ��>0 and cjn>1 then
        if os.time()<cj_last_time+��������.�ȴ�ʱ��*60 then return end
    end
    Win.Print(("��:%d��"):format(cjn))
    ret = ����.ִ��(true)
    if ret~=0 then
        if type(��������.����f)=="function" then
            ��������.����f(ret)
        else 
            while ret~=0 do --default
                Win.Pop('���ƻ����ƣ�',true)
                Kan.RepairEx(1,12,12)
                ret = ����.ִ��(true)
            end
        end
    end

    ͨ��.�ȴ�ĸ��(1000)
    
    if type(��������.����f)=="function" then
        ��������.����f() --TODO
        ret = ����.ִ��(true)
    end
    
    if ret==0 then
        if type(��������.����f)=="function" then
            ��������.����f("print_state")
        end
        ͨ��.�ȴ�ĸ��(2000)
        local k=��������.����ս��f()
        if k==-10 then 
            ˢ����Ϸ()   --�Զ�ˢ��
        end
        cjn=cjn+1
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