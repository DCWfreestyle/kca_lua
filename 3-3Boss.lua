require("\\Lua\\Battle")
require("\\Lua\\����Զ��")
include_�޴�=true
require("\\Lua\\��ʯ�޴�")
--i added this 
include_formedcag=true
require("\\Lua\\formedcga")
rl=0
hc=0

local iss=false
local rest=5
function ��·�ж�(lastp)
	while true do
		if  lastp==1 then return 2 end
		if lastp==2 then return 2.5 end
		if Base.IsColor(498,276,6086807) and lastp~=3 then return 3 end
		if Base.IsColor(604,172,6416032) then return 4 end
		if Base.IsColor(303,163,5263431) then return 5 end
		if ����() then ���̴���() end
		Base.Sleep(100)
	end
end

function ս��33()
Base.Click(645,223)
Base.Sleep(500)
if ���Գ���()==false then --���ܳ���������-1
	Win.Pop("���ܳ�����",true)
	--return -1
end
Win.Print("����3-3��")
Base.ClickRectEx(626,448,25,20)
Go_On=true
point=1
while Go_On do --�һ����Դ�
	point=��·�ж�(point)
	if     point<4 then
		Win.Print("��BOSS")
		Go_On = Dս��(1,false,true)
		if Go_On==0 then return true end
	elseif point==4 then --BOSS
		Win.Print("BOSS")
		iss=true
        rest=rest-1
		Go_On = Dս��(1,true,false)
		break
	elseif point==5 then
		Win.Print("������δ�ܽ���BOSS")
		Dս��(1,false,true)
		break
	end
	Base.Sleep(100)
end

if iss then
p("BOSS wo uchi to tta ri")
else
p("Failed")
end

return true

end


function D����(�������� ) --table ����f ,����ս��f,����f,�ȴ�ʱ��,��������,����f
--TODO:��μ���..
    if cjn==nil then --initial
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
        D����(��������)
        ����һ��Զ��()
        Base.Sleep(1000*5)
		p("rest:",rest)
    end
end

if hc==1 then hcg[2]() end
����andԶ��({����f=nil ,����ս��f=function() ����.ִ��(3, 3) return ս��33() end,����f=0,�ȴ�ʱ��=6,��������=0,����f=function() return rest==0 end })