require("\\Lua\\Battle")

include_formedcag=true
require("\\Lua\\formedcga")
rl=0
hc=0

local iss=false
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
		Go_On = Dս��(1,true,false)
		break
	elseif point==5 then
		Win.Print("������δ�ܽ���BOSS")
		Dս��(1,false,true)
		break
	end
	Base.Sleep(100)
end


return true

end

if hc==1 then hcg[2]() end
����.ִ��(3,3)
ս��33()
ͨ��.�ȴ�ĸ��(500)
����.ִ��() 


if rl==1 then
ͨ��.�ȴ�ĸ��(500)
Base.ClickRectEx(399,460,10,5) --�ͷ�
end

if iss then
p("BOSS wo uchi to tta ri")
else
p("Failed")
end