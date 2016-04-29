require("\\Lua\\Battle")
require("\\Lua\\尝试远征")
include_修船=true
require("\\Lua\\明石修船")
include_formedcag=true
require("\\Lua\\formedcga")


function D出击(出击策略 ) --table 换船f ,出击战斗f,修理f,等待时间,出击次数,结束f,等待打印f

    if ended then return end
    if cjn==nil then --initial
        --入参检验..
        if 出击策略.等待时间==nil then 出击策略.等待时间=0 end
        if 出击策略.出击次数==nil then 出击策略.出击次数="inf" end --infinite
        if type(出击策略.结束f)~="function" then 出击策略.结束f=0 end
        if type(出击策略.换船f)~="function" then 出击策略.换船f=0 end
        if type(出击策略.等待打印f)~="function" then 出击策略.等待打印f=0 end
        if type(出击策略.换船f)~="function" then 
            ended=true
            return
        end
        if type(出击策略.修理f)~="function" then 出击策略.修理f=0 end
        cjn = 1 --globa
        ended=false
        local ret=0
    end
    if (出击策略.出击次数>=1 and cjn>出击策略.出击次数) or ( 出击策略.结束f ~=0 and 出击策略.结束f()) then 
        --结束判断以及结束后处理
        ended=true
        if rep==1 then
        全部修理()
        end
        补给.执行(true)
        return
    end
    if 出击策略.等待时间>0 and cjn>1 then
        if os.time()<cj_last_time+出击策略.等待时间*60 then 
            if 出击策略.等待打印f~=0 then --等待时的操作
                出击策略.等待打印f()
            end
        return end
    end
    Win.Print(("第:%d次"):format(cjn))
    ret = 补给.执行(true)
    if ret~=0 then
        if type(出击策略.修理f)=="function" then
            出击策略.修理f(ret)
        else 
            while ret~=0 do --default
                Win.Pop('大破或中破！',true)
                Kan.RepairEx(1,12,12)
                ret = 补给.执行(true)
            end
        end
    end
    if type(出击策略.换船f)=="function" then
        出击策略.换船f() --TODO
        ret = 补给.执行(true)
    end
    if ret==0 then
        if type(出击策略.换船f)=="function" then
            --TODO：要求换船函数打印状态
            --出击策略.换船f("print_state")
        end
        local k=出击策略.出击战斗f()
        if k==-10 then 
            刷新游戏()   --自动刷新
        end
        cjn=cjn+1
        cj_last_time = os.time()
    end
    通用.等待母港(2000)
end


function 出击and远征(出击策略)
    while true do 
        D出击(出击策略)
        尝试一次远征()
        Base.Sleep(1000*5)
    end
end
--sample:
--出击and远征({出击战斗f=function() 出击.执行(3, 3) return 战斗33() end,等待时间=6,结束f=function() return rest==0 end })