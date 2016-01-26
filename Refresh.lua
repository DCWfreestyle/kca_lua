require("\\Lua\\BaseFunc")
-- Manual_Refresh
function 启动画面()
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
function 等待重启()
	while 启动画面()==false do Base.Sleep(500) end
	tc(655,400)
end

function 刷新游戏()
Win.Pop('糟糕，进坑了，请刷新',true)
if Manual_Refresh==1 then
	等待重启()
elseif sdsx==0 then 
	Win.Print("游戏已断开链接！")             --重启脚本
end
end
