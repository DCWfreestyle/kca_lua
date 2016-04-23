
--Default
if k2_conquest==nil and k3_conquest==nil and k4_conquest==nil then
k2_conquest = C.防空射撃演習_ID6
k3_conquest = C.東京急行弐_ID38
k4_conquest = C.警備任務_ID3
end
--
local check_time = {3,5}
local yz_last_time = os.time()
local run_count = 0
local yz_delay_time=0
--执行
function 尝试一次远征()
if  os.time()<=yz_last_time+yz_delay_time*60 then return end
run_count = run_count + 1
Win.Print("远征尝试第"..run_count.."次")
--start
ret = Kan.ConquestGet()
Base.Sleep(2000)
a,b,c,d = Kan.SupplyAll() --执行1234舰队的补给

Win.Print("补给完毕 尝试远征")
if b ~= C.SUPPLY_STATE_CONQUEST and b ~= -1 and k2_conquest ~= nil then 
	Kan.Conquest(2,k2_conquest[1],k2_conquest[2])
end

if c ~= C.SUPPLY_STATE_CONQUEST and c ~= -1 and k3_conquest ~= nil then
	Kan.Conquest(3,k3_conquest[1],k3_conquest[2])
end

if d ~= C.SUPPLY_STATE_CONQUEST and d ~= -1 and k4_conquest ~= nil then
	Kan.Conquest(4,k4_conquest[1],k4_conquest[2])
end

Win.Print("尝试远征完毕")
yz_last_time=os.time()
Kan.WaitHomeEx(2000,1000 * 120) --单次周期时间/超时时间
--end()
math.randomseed(os.time())
yz_delay_time = math.random(check_time[1],check_time[2]) --取随机分钟数3-5
Win.Print("等待"..yz_delay_time.."分钟")
end