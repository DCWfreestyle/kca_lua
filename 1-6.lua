require("\\Lua\\Battle")
include_formedcag=true
require("\\Lua\\formedcga")
rl=1
hc=0

function ��·�ж�(lastp)
	while true do
		if  lastp==1 then return 2 end
		if lastp==2 then return 3 end
		if  lastp==3 then return 4 end
		if ����() then ���̴���() end
		Base.Sleep(100)
	end
end

function ս��16()
Base.Click(645,223)
Base.Sleep(500)
if ���Գ���()==false then --���ܳ���������-1
	Win.Pop("���ܳ�����",true)
	--return -1
end
Base.ClickRectEx(626,448,25,20)
Win.Print("����1-6��")
Go_On=true
point=1
while Go_On do --�һ����Դ�
	point=��·�ж�(point)
	if     point==2 then
		Go_On = Dս��(5,false,true)
		���̴���()
	elseif point==3 then
		Go_On = Dս��(3,false,true)
	elseif point==4 then  --ǿ�н���
		Dս��_ǿ�н���(1,false)
		break
	end
	Base.Sleep(100)
end
waitsta(754,448,9868310)
tc(50,50)

return true

end

if hc==1 then hcg[11]() end
����.ִ��(1,6)
ս��16()
����.ִ��() 

if rl==1 then
ͨ��.�ȴ�ĸ��(2000)
Base.ClickRectEx(399,460,10,5) --�ͷ�
end
