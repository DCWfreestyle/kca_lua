require("\\Lua\\BaseFunc")
-- Manual_Refresh
function ��������()
	array = {}
	count = {}
	
array = {[0]=569,193,4770794}
count[0] = array
array = {[0]=117,434,16777161}
count[1] = array
array = {[0]=503,321,13218434}
count[2] = array
array = {[0]=501,320,16777209}
count[3] = array
array = {[0]=485,404,9146127}
count[4] = array
array = {[0]=605,370,12498188}
count[5] = array

	return IsColorAll(count)

end
function �ȴ�����()
	while ��������()==false do Base.Sleep(500) end
	tc(655,400)
end

function ˢ����Ϸ()
Win.Pop('��⣬�����ˣ���ˢ��',true)
if Manual_Refresh==1 then
	�ȴ�����()
elseif sdsx==0 then 
	Win.Print("��Ϸ�ѶϿ����ӣ�")             --�����ű�
end
end
