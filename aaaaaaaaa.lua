--2016���� E2
--���ȰѲ���Ҫ�ϳ��Ĵ�������

--��·M���̴��ű�����������ʲô�ģ� + Զ��


--������ʹ�õ���3DD+3��Ѳ 100%��·M 
--ϼ��2 poi ����Ѳ ����
--������Կ�CI ����ͨ���� �ɴ�1-2��ˮ����֤��һ����Sʤ 
--��Ѳ���������+�ױ�+���̽ DD��������
--Ĭ����С�����ϵĴ� ���˲���

--��Լ��һ����1��Ͱ
---------------------------------------------------------------------------------
--��������������

Kan.DelBattleInfo()
Kan.AddBattleInfo(1,5,false,false) --�� ��Ǳ
Kan.AddBattleInfo(2,3,false,false) --�� �Կ�
Kan.AddBattleInfo(3,1,false,false) --�� ��С��
Kan.AddBattleInfo(4,1,true,false) --�� M��Ⱥ�� ҹս
--Kan.AddBattleInfo(5,1,true,false)  --�� ҹս Boss
--2\3Ϊҹս�㣬�ɿ��ǵ��ᣨ5�����ر�CI
--ÿ�����ս������ ���Ҫ�޸�Ϊ��Ļͼ��ʱ����Ҫ��

Kan.AddWay(359,122) 
--�ܶ��� ��·I��

--kan_support_boss_id = 2
--Զ��Boss֧Ԯ����ID

--kan_support_id = 3
--Զ������֧Ԯ����ID

count = 40
--ִ�д���

---------------------------------------------------------------------------------
--����������޸�Ϊ��Ļͼ��ʱ�����Ҫ��

team_id = 1
--�����Ķ���ID,���Ͻ��ӵĻ�����д12

use_way = true
--�Ƿ�ʹ���ܶ��� ��ͼ�������Ҫʹ���ܶ��� ��дfalse

map_id = 3
--������ͼE1�������и�Ϊ����ͼ�̴�

map_battle_count = 4
--�ڵ�ͼ�н��м������ս�� ����Ҳ���� ���ǲ����� ���˵�Bossǰ�ͳ����� 
--(��������Դ����ܶ��㻹�����еȲ�ս���ĵ������)
---------------------------------------------------------------------------------

function SupplyAllStringMatch(_str)
    local t2 = { string.match(_str , "^(-?%d+),(-?%d+),(-?%d+),(-?%d+)|(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)") }
    --�����ص�����ƥ�䵽����
    t = {}

    for key, value in pairs(t2) do  
        table.insert(t,tonumber(value))
    end  --תΪ��ֵ
    Base.Print(string.format("����״̬:%d %d %d %d",t[1],t[2],t[3],t[4]))
    Base.Print(string.format("��һ���ӵ���״̬:%d %d %d %d %d %d",t[5],t[6],t[7],t[8],t[9],t[10]))
    
    return t
end

function cj()
    a = "��ʼ��:%d��"
    Win.Print(a:format(n))

    ret = Base.CallFunc("Kan.SupplyAll") --����ȫ����������������
    Base.Print(ret)

    t = SupplyAllStringMatch(ret) --���ص��ı�ת��table

    if kan_support_boss_id ~= nil and t[kan_support_boss_id] ~= -3 then
        Kan.Conquest(kan_support_boss_id,10,2) --����Boss֧Ԯ
    end

    if kan_support_id ~= nil and t[kan_support_id] ~= -3 then
        Kan.Conquest(kan_support_id,10,1) --��������֧Ԯ
    end

    if t[5]>0 or t[6]>0 or t[7]>0 or t[8]>0 or t[9]>0 or t[10]>0 then
        Win.Print('����/��/С�ƣ�ʹ�ý�������')
        
        --�������С�ƵĴ� 6�� ��Ǳͧ��Ĵ���ʹ��Ͱ����
        --�����𻵳̶�[����С��]�������Ͱѵ���������+1ȥ��
        Kan.RepairEx(6, 16, 2 + 4 + 8 )

    elseif t[1] == -1 then
        Win.Pop('�������� �ű�ֹͣ��',true)
        break
    end

    Kan.Sally(10, map_id) --����E4


    --��һ����\ս��4��\ʹ���ܶ���
    if Kan.BattleEx(team_id, map_battle_count , use_way) == false then
        LastBattleCount = Base.GetValue("LastBattleCount")
        Win.Print(LastBattleCount)    
        
        if LastBattleCount ~= nil then
            min = (7 - tonumber(LastBattleCount)) * 3
            Win.Print('ս������..�ȴ�'..min ..'���ӻָ�ƣ���ٴ�...')
            Base.Sleep(1000 * 60 *  min) --�ȴ�ʱ��
        else
            Win.Print('ս������..�ȴ�24���ӻָ�ƣ���ٴ�...')
            Base.Sleep(1000 * 60 *  24) --�ȴ�ʱ��
        end
    else
		boss_lv = Base.GetValueInt("Battle_Lv_5") --ȡ��5��ʤ���ȼ� 6=ss 
		if boss_lv < C.WIN_S and boss_lv > C.WIN_ERROR then 
			time_min = (6 + (5 - boss_lv) * 3)
		    Win.Print('[δSʤ]ս����������..�ȴ�' .. time_min .. '���ӻָ�ƣ���ٴ�...')
        	Base.Sleep(1000 * 60 * time_min) --�ȴ�ʱ��
		else
		    Win.Print('ս����������..�ȴ�12���ӻָ�ƣ���ٴ�...')
        	Base.Sleep(1000 * 60 * 12) --�ȴ�ʱ��
		end

    end

    Kan.WaitHome(2000)
    Base.Sleep(2000)
	YuanZheng()
end



while true do
	Win.Print('����Զ��ѭ���ȴ�1��')
    Base.Sleep(60*1000)
	YuanZheng()
end

Win.Pop('�ű�ִ����ϣ�')