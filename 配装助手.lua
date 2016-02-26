require("\\Lua\\changebynew")
require("\\Lua\\工具")
--   set include_modhelper=true
local GROUPS = {
		{143,89,63},
		{138,136},
		{128,137}}
local function getfromtables(T)  --组成
    local ret={}
    for k,v in pairs(T) do
        if type(v) == "table" then
        T[k]=getfromtables(v)
        end
    end
    for k,v in pairs(T) do
       if type(v) == "table" then
            for k2,v2 in pairs(v) do
                table.insert(ret,v2)
            end
        elseif type(v) == "number" then
            table.insert(ret,v)
        end
	end
     return ret
end

local function dividcgp(T)
    local ret={}
    local subT={}
    local pos=1 -- 1~6
    for k,v in pairs(T) do
        table.insert(subT,v)
        pos=pos+1
        if pos>6 or k==#T then
            table.insert(ret,subT)
            subT={}
            pos=1
        end
     end
     return ret
end

function 配装助手(T)
    local B = dividcgp( getfromtables( T))
    for k,v in pairs(B) do
        cgall(v)
        GoMod()
        通用.等待母港(2000)
    end
end

if include_modhelper==nil then
    配装助手(GROUPS)
end

