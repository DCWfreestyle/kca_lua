--require("\\Lua\\����")

-------------------------------------------------------------------
-- This library defines table_print(tb), table_tostring(tb) for 
-- printing table data
-- 
-- Author: Hevake Lee
-- Email : hevake_lcj@126.com
-------------------------------------------------------------------
----���Ʊ� copyTab(st)
local function _list_table(tb, table_list, level)
    local ret = ""
    local indent = string.rep(" ", level*4)

    for k, v in pairs(tb) do
        local quo = type(k) == "string" and "\"" or ""
        ret = ret .. indent .. "[" .. quo .. tostring(k) .. quo .. "] = "

        if type(v) == "table" then
            local t_name = table_list[v]
            if t_name then
                ret = ret .. tostring(v) .. " -- > [\"" .. t_name .. "\"]\n"
            else
                table_list[v] = tostring(k)
                ret = ret .. "{\n"
                ret = ret .. _list_table(v, table_list, level+1)
                ret = ret .. indent .. "}\n"
            end
        elseif type(v) == "string" then
            ret = ret .. "\"" .. tostring(v) .. "\"\n"
        else
            ret = ret .. tostring(v) .. "\n"
        end
    end

    local mt = getmetatable(tb)
    if mt then 
        ret = ret .. "\n"
        local t_name = table_list[mt]
        ret = ret .. indent .. "<metatable> = "

        if t_name then
            ret = ret .. tostring(mt) .. " -- > [\"" .. t_name .. "\"]\n"
        else
            ret = ret .. "{\n"
            ret = ret .. _list_table(mt, table_list, level+1)
            ret = ret .. indent .. "}\n"
        end
        
    end

   return ret
end

-------------------------------------------------------------------
-- Public functions
-------------------------------------------------------------------

function table_tostring(tb)
    if type(tb) ~= "table" then
        error("Sorry, it's not table, it is " .. type(tb) .. ".")
    end

    local ret = " = {\n"
    local table_list = {}
    table_list[tb] = "root table"
    ret = ret .. _list_table(tb, table_list, 1)
    ret = ret .. "}"
    return ret
end

function table_print(tb)
    Win.Print(tostring(tb) .. table_tostring(tb))
end

-------------------------------------------------------------------


--���Ʊ�
function copyTab(st)
    local tab = {}
    for k, v in pairs(st or {}) do
        if type(v) ~= "table" then
            tab[k] = v
        else
            tab[k] = copyTab(v)
        end
    end
    return tab
end
