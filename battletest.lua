require("\\Lua\\changebynew")
require("\\Lua\\尝试远征")

include_修船=true
require("\\Lua\\明石修船")

function 





end

function 出击(出击策略 ) --table 换船f ,出击战斗f,修理f,等待时间,出击次数,结束f
--TODO:入参检验..
    if cjn=nil then --initial
        cjn = 1 --globa
        ended=false
        local ret=0
    end
    if ended then return end
    if (出击策略.出击次数>=1 and cjn>出击策略.出击次数) or (type(出击策略.结束f)=="function" and 出击策略.结束f()) then 
        ended=true
        if rep==1 then
        全部修理()
        end
        补给.执行(true)
        return
    end
    if 出击策略.等待时间>0 and cjn>1 then
        if os.time()<cj_last_time+出击策略.等待时间*60 then return end
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

    通用.等待母港(1000)
    
    if type(出击策略.换船f)=="function" then
        出击策略.换船f() --TODO
        ret = 补给.执行(true)
    end
    
    if ret==0 then
        if type(出击策略.换船f)=="function" then
            出击策略.换船f("print_state")
        end
        通用.等待母港(2000)
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
        出击(出击策略)
        尝试一次远征()
        Base.Sleep(1000*2)
    end
end