require("\\Lua\\Battle")
require("\\Lua\\����Զ��")
include_�޴�=true
require("\\Lua\\��ʯ�޴�")
include_formedcag=true
require("\\Lua\\formedcga")


function D����(�������� ) --table ����f ,����ս��f,����f,�ȴ�ʱ��,��������,����f,�ȴ���ӡf

    if ended then return end
    if cjn==nil then --initial
        --��μ���..
        if ��������.�ȴ�ʱ��==nil then ��������.�ȴ�ʱ��=0 end
        if ��������.��������==nil then ��������.��������="inf" end --infinite
        if type(��������.����f)~="function" then ��������.����f=0 end
        if type(��������.����f)~="function" then ��������.����f=0 end
        if type(��������.�ȴ���ӡf)~="function" then ��������.�ȴ���ӡf=0 end
        if type(��������.����f)~="function" then 
            ended=true
            return
        end
        if type(��������.����f)~="function" then ��������.����f=0 end
        cjn = 1 --globa
        ended=false
        local ret=0
    end
    if (��������.��������>=1 and cjn>��������.��������) or ( ��������.����f ~=0 and ��������.����f()) then 
        --�����ж��Լ���������
        ended=true
        if rep==1 then
        ȫ������()
        end
        ����.ִ��(true)
        return
    end
    if ��������.�ȴ�ʱ��>0 and cjn>1 then
        if os.time()<cj_last_time+��������.�ȴ�ʱ��*60 then 
            if ��������.�ȴ���ӡf~=0 then --�ȴ�ʱ�Ĳ���
                ��������.�ȴ���ӡf()
            end
        return end
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
    if type(��������.����f)=="function" then
        ��������.����f() --TODO
        ret = ����.ִ��(true)
    end
    if ret==0 then
        if type(��������.����f)=="function" then
            --TODO��Ҫ�󻻴�������ӡ״̬
            --��������.����f("print_state")
        end
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
        D����(��������)
        ����һ��Զ��()
        Base.Sleep(1000*5)
    end
end
--sample:
--����andԶ��({����ս��f=function() ����.ִ��(3, 3) return ս��33() end,�ȴ�ʱ��=6,����f=function() return rest==0 end })