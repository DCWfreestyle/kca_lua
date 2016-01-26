--远征时间表：
--2： 30min      5:  90min     21:  140min       格式：60*min         os.time()单位是秒，注意
--Base.SetConfig("Sleep+?",800)
--下一次远征时间，初始化
--负1表示还未开始
require("\\Lua\\ztaskVer2")
yzt1=os.time()-1+60*55
yzt2=os.time()-1+60*21
yzt3=os.time()-1+60*0
--远征目标               21：{3,5}140min   37：{5,5}165min   38:{5,6}175min   
k2_conquest = {3,5}
k3_conquest = {1,5}
k4_conquest = {1,2}  --{3,5}
--远征用时常数
hs1=60*140  --17.5
hs2=60*90 --40
--hs3=60*140
hs3=60*30  --30
en1=true
en2= true
en3=true

--多任务相关
men =1 ------开启调度
number_of_tasks = 2 -------任务数量
task_id = 0		------任务ID，从0开始

local np=0
--
--===============

function td() --n-delaytime-akm
	n=0
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))
	delaytime= math.random(20,80)
	if (n+1)%12 == 0 then 
              	delaytime=delaytime+360
              end
	delaytime=60*2.2+delaytime          ----------2分钟以上
	akm = "Random_Delay:%.2f分钟休眠"
	Win.Print(akm:format(delaytime/60))
	Base.Sleep(1000*delaytime) 
	n=n+1
end

-----------------
function dsyz()                    --定时远征
    local  ct=os.time()    --CurrenTime
      Win.Print("远征判定")
      ak = "现在时间:%d秒"
	Win.Print(ak:format(ct))
      if((en1 and ct>=yzt1) or (en2 and ct>=yzt2) or (en3 and ct>=yzt3) ) then --检查是否应该执行远征检查
            ---------------------------------------------------------
            Base.InitHWND() --建议长期跑的脚本增加 避免出现色彩判断异常

	ak = "远征第:%d次"
	Win.Print(ak:format(np))
	-----------------------
	--m()
-----------------------------
	开始占用() ------###########################################
	ret = 远征.收回() 
	--全部收回 会自动进入一次出击并返回母港来刷新出击状态

	Base.Sleep(2000)

	a,b,c,d = 补给All.执行() --执行1234舰队的补给
	Win.Print("补给完毕 尝试远征")


	if b ~= -3 and en1 then --判断第二战队不在远征状态
	远征.执行(2,k2_conquest[1],k2_conquest[2]) --2
    yzt1=os.time()+hs1
	end

	if c ~= -3 and en2 then
	远征.执行(3,k3_conquest[1],k3_conquest[2]) --東京急行2
    yzt2=os.time()+hs2
	end

	if d ~= -3 and en3 then
	远征.执行(4,k4_conquest[1],k4_conquest[2]) --海上護衛任務
    yzt3=os.time()+hs3
	end
	np=np+1
	结束占用() ---###############################
	Win.Print("尝试远征完毕")

      end
end


---=======
for k=0,10000 do
      dsyz()
      td() --pp2+分钟检查
end
结束占用()