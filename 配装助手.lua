require("\\Lua\\changebynew")
require("\\Lua\\����")
--   set include_modhelper=true
local GROUPS = {		{133,135,89,28,7,20 ,21, 22, 36, 40,
	65 ,117,37, 81, 83, 14, 119},   --CA/CAV
		{124,132,39}  --eugen zara
		}
local function getfromtables(T)  --���
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

function ��װ����(T)
    local B = dividcgp( getfromtables( T))
    for k,v in pairs(B) do
        cgall(v)
        GoMod()
        while not ����Ƿ���ĸ��() do
	 		Base.Sleep(1000)
		end
    end
end

if include_modhelper==nil then
    ��װ����(GROUPS)
end

