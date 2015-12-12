require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
Manual_Refresh=1           ---手动刷新，1为手动 ，0自动
rfe=1
function 线路判断(lastp)
-- 正确=1  沟=2
	while true do
		if Base.IsColor(661,293,6416032) and lastp~=1 then return 1 end
		if Base.IsColor(547,279,6086807) and lastp~=2 then return 2 end
		Base.Sleep(100)
	end
end

function 出击51()
if 可以出击()==false then --不能出击，返回-1
	Win.Pop('不能出击！')
	Win.Print('不能出击！')
	return -1
end
Base.Sleep(3300)
tc(628,442)               --第一舰队
Win.Print('第一舰队5-1出击')
Base.Sleep(3000)
while 在罗盘()==false do Base.Sleep(300) end
Base.Sleep(3000)
选择罗盘()
if 线路判断(0)==2 then
	return -10 -----路线错误!
end
Win.Print('线路正确')
Base.Sleep(700)
D战斗(5,false,false)
return 0
end

function 肝船5_1()
for n = 0, 100 do --循环次数
	
	a = "开始第:%d次"
	Win.Print(a:format(n))

	ret = 补给.执行() --只补给舰队1

	if ret > 0 then
                                          入渠.执行(1)
			Win.Print('舰船大破')
			Win.Pop('舰船大破')

		break
	elseif ret == -1 then
		--出错
			Win.Print('补给不足 脚本停止！')
			Win.Pop('补给不足 脚本停止！')
		break
	elseif ret == -2 then
		--出错
			Win.Print('远征中 脚本停止！')
			Win.Pop('远征中 脚本停止！')
		break
	end


	--------------------    5-1特殊
	出击.执行(5,1)
	k=0
	k=出击51()
	if k==-10 then 
		刷新游戏()
	end
	-------------------------
	通用.等待母港(1500)
    math.randomseed(os.time())
	min = math.random(1,3) 
    if (n+1)%10 == 0 then 
        Base.Sleep(1000*60*min) --停1分钟 
    end
	Base.Sleep(2000)

end

Win.Pop('脚本执行完毕！')
end


肝船5_1()
if rfe==1 then Release() end