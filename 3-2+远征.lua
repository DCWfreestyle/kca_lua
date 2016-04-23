require("\\Lua\\changebynew")
require("\\Lua\\尝试远征")

include_修船=true
require("\\Lua\\明石修船")
潜艇位置 = 4 --推荐4号位置


ss={				--潜艇替换组，start,end,page
[0]={7,8,2},
{1,3,3},
{2,2,3}
}
ns=#ss+1
sta=0 ----sta=0,1 , ...... , ns-1
--出击相关
local zd32 =1  --------- 1出击3-2 .0出击3-3
local 出击次数=70
local n=1;local ended = false

local rep=1              --修船
ssmethod=1
cgen =1
needchange=true

Kan.AddKanChangeName("潜水舰马路油", 1, 15,  true, 0, 潜艇位置);

--使用cgInGroups()前,设置 
groups={--137 石印
		{133,135,89,28,7,20 ,21, 22, 36, 40,
	65 ,117,37, 81, 83, 14, 119},   --CA/CAV
		{117,37,23,27}, --cvl
		{124,132,39}  --eugen zara
		}
cgstas={					--[位置]={组,组内序号}
		[2]={1,1},
		[3]={1,1},
		--[6]={1,1},
		[5]={1,1},
		[1]={3,1}
		}
--[[
ca:	7足柄 20羽黑 21(lv8)古鹰 22妙高
	25摩耶 28衣笠 36加古 39鸟海 40爱宕
	65青叶(lv4) 68那智 

cav:
	72利根 73筑摩 81熊野 83铃谷 14最上  129三V
	]]
------------------------------------------------------------------------------------

function 练级323( )

if ended then return end
if n>出击次数 then
	ended=true
	if rep==1 then
	全部修理()
	end
	补给.执行(true)
	return
end

Win.Print(("开始第:%d次"):format(n))


ret =  Kan.Supply() --只补给舰队1

if ret > 0 then
	if ret == 潜艇位置 then
		if ssmethod==0 then
			for pn=1,ns do
			scg=Kan.Change(ret,ss[sta][1],ss[sta][2],ss[sta][3],1)
			sta=(sta+1)%ns
			if scg then break end
			end
			if scg==true then
			Win.Print('成功替换潜艇')
			入渠.执行(1)
			else
			Win.Pop('没有可替换的潜艇 脚本停止！',true)
			return
			end
		else
			Kan.ChangeDIY(2,1,0,3,false)
			入渠.执行(1)
		end
		
	else
		Kan.RepairEx(1,12,12)
	end

elseif ret==-1 or ret==-2 then
        Win.Pop('补给不足\\远征中 脚本停止！',true)
        ended=true
elseif ret==0 and n~=-1 and needchange==true then 
		cgInGroups() needchange=false
elseif ret==0 then
		if zd32==1 then
			出击.执行(3, 2) --目标 3-2
		else
			出击.执行(3, 3)
		end
		if 战斗.执行(1, 1, false, 2) == false then
		Win.Print('可能无法出击或道中大破')
		end
		通用.等待母港(2000)
		n=n+1
		needchange=true
end

end

while true do 
	练级323( )
	尝试一次远征()
	Base.Sleep(1000*2)
end