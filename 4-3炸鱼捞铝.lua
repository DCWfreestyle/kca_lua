require("\\Lua\\ztaskVer2")
require("\\Lua\\Battle")
require("\\Lua\\changebynew")
require("\\Lua\\尝试远征")       --尝试一次远征()
local 捞铝=1             --选择是否捞铝，1是，0否
local 休眠时间=0
local 运行次数=10
--远征
k2_conquest = C.長距離練習航海_ID2 --指向远征名可查看远征要求
k3_conquest = C.海上護衛任務_ID6 --指向远征名可查看远征要求
k4_conquest = C.防空射撃演習_ID5 --指向远征名可查看远征要求
--------下面的设置不用管
changekan4_3=true
men = 0 ------开启调度
number_of_tasks = 2 -------任务数量
task_id = 1		------任务ID
local rfe=false
local cj_last_time = os.time()
--=====================
local ssta=0
local n=1
cg43={
[0]=function() return cgallbutflag({92,118,36,62,76}) end,  	--大井
function() return cgallbutflag({51,85,68,50,45}) end,		--北上
function() return cgallbutflag({87,27,22,34,19}	) end		--木曾
}

function 线路判断(lastp)
-- J(战斗)=1  F(SS)=2 K(SS)=3 D(ss)=4 G(沟)=5 E(铝)=6
	local xcrecorder=0
		Win.Print("线路判断开始")
	while xcrecorder<=1000 do
		if Base.IsColor(661,293,6416032) and lastp~=1 then return 1 end
		if Base.IsColor(547,279,6086807) and lastp~=2 then return 2 end
		if Base.IsColor(566,366,6218393) and lastp~=3 then return 3 end
		if Base.IsColor(477,238,16775936)and lastp==2 then return 4 end
		if Base.IsColor(400,182,16775936)and lastp~=5 then return 5 end --路径
		if Base.IsColor(353,120,16775936)and lastp~=6 then return 6 end --路径
		if 罗盘() then 罗盘处理() Win.Print("罗盘处理完毕") end
		Base.Sleep(100)
		xcrecorder=xcrecorder+1
	end
end

function 出击4_3()
Base.Click(645,223)
Base.Sleep(500)
if 可以出击()==false then --不能出击，返回-1
	Win.Pop("不能出击！",true)
	return -1
end
Base.Sleep(3500)
Win.Print("出击4-3！")
Base.ClickRectEx(626,448,25,20)

罗盘处理()
Go_On=true
point=0
mstr="START"
while Go_On==true do --我还可以打
	point=线路判断(point) Win.Print("线路判断结束")
	if     point==1 then --j
		mstr=mstr.."-J"
		Win.Print(mstr)
		Go_On = D战斗(1,false,true)
	elseif point==2 then --f
		mstr=mstr.."-F"
		Win.Print(mstr)
		Go_On = D战斗(5,false,true)
	elseif point==3 then --k
		mstr=mstr.."-K"
		Win.Print(mstr)
		Go_On = D战斗(5,false,false)
		return 0
	elseif point==4 then --d
		mstr=mstr.."-D"
		Win.Print(mstr)
		if 捞铝 == 1 then
			Go_On = D战斗(5,false,true)
		else 
			Go_On = D战斗(5,false,false)
			return 0
		end
	elseif point==5 then --g
		mstr=mstr.."-G"
		Win.Print(mstr)
		Win.Pop("沟了，请刷新",true)
		return -10
	elseif point==6 then --e
		mstr=mstr.."-E"
		Win.Print(mstr)
		D战斗(1,false,false) --捞铝
		return 0
	end
	Base.Sleep(100)
end
Win.Print("出击：有大破发生")
return false

end

function 肝船4_3()
while n <= 运行次数 do --循环次数
	Win.Print(( "开始第:%d次"):format(n))
开始占用() --########################################
	ret = 补给.执行(true) --只补给舰队1

	if ret > 0 then
        --入渠.执行(1)
		while ret~=0 do
			Win.Pop('大破或中破！',true)
			Kan.RepairEx(1,12,12)
			ret = 补给.执行(true)
		end
	elseif ret == -1 then
		--出错
			Win.Print('补给不足 脚本停止！')
			Win.Pop('补给不足 脚本停止！')
		n=运行次数+2
	elseif ret == -2 then
		--出错
			Win.Print('远征中 脚本停止！')
			Win.Pop('远征中 脚本停止！')
		n=运行次数+2
	end
	
	if ret==0 and n~=1 and 休眠时间>0 then 
		休眠ex(1000*60*休眠时间) --
	end
	if changekan4_3 then 
		cg43[ssta]()--换船
		ssta=(ssta+1)%(#cg43+1)
		ret = 补给.执行(true)
	end
	--------------------
	if ret==0 then 
		Kan.Sally(4,3)
		k=出击4_3()
		if k==-10 then 
		刷新游戏()   --自动刷新
		end
		n=n+1
	end
	-------------------------
	
	通用.等待母港(1500)
	
	Base.Sleep(2000)
结束占用()--###########################
if men==0 then 尝试一次远征() end
end
补给.执行(true)
if rfe then Release() end
Win.Pop('脚本执行完毕！')
end

function 肝船4_3T()
if n > 运行次数 or os.time()<cj_last_time+休眠时间 then return end
	Win.Print(( "开始第:%d次"):format(n))
	ret = 补给.执行(true) --只补给舰队1

	if ret > 0 then
		while ret~=0 do
			Win.Pop('大破或中破！',true)
			Kan.RepairEx(1,12,12)
			ret = 补给.执行(true)
		end
	elseif ret == -1 then
			Win.Pop('补给不足 脚本停止！',true)
		n=运行次数+2
	elseif ret == -2 then
			Win.Pop('远征中 脚本停止！',true)
		n=运行次数+2
	end
	
	if changekan4_3 then 
		cg43[ssta]()--换船
		ssta=(ssta+1)%(#cg43+1)
		ret = 补给.执行(true)
	end
	--------------------
	if ret==0 then 
		Kan.Sally(4,3)
		k=出击4_3()
		if k==-10 then 
			刷新游戏()   --自动刷新
		end
		n=n+1
		cj_last_time = os.time()
	end
	-------------------------
	通用.等待母港(1500)
	Base.Sleep(2000)
	if n>运行次数 then
		补给.执行(true)
		Win.Pop('脚本执行完毕！')
	end
end
--肝船4_3()
while true do
肝船4_3T()
尝试一次远征()
Base.Sleep(1000*2)
end