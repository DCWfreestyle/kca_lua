--2015 ��� E4ˮ����·������ �� ����4ս��2սǱͧ��
--���Զ����� �ȴ�ƣ�� 
--������������ ��ȥ��ף���Ϊ���ʶ�һ����
--��֮ǰ��Ҫ�������𻵵Ĵ����ڣ��еĻ�ȫ�޺�
--����ǿ�Ȳ��ߣ�Ĭ�ϲ�����С��С�ƵĴ���
--֧�ֽ������㣨��ʼ1�Σ�����ÿ������ִ��һ�Σ����������Ķ����ã�
---------------------------------------------------------------------------------
--����ű�����Ա��ģ�������һᵼ�������˽��ȣ��������� 
--�������޸ĺ���E4LvChange -> Base.Click(363,267) ��Ϊ������ս����
---------------------------------------------------------------------------------
--������������� ˮ��
--1�� BSM\��(˫�ڳ��׷ɻ�) ��ĸ*2(�ƿ�200+) ���\Ϧ��(��Ǳ)
--2�� ����(�Կ�CI) Ϧ������(��Ǳ) ����Ѳ�����ٴ�һ��ҹսCI��
---------------------------------------------------------------------------------
--�������������� �������ϸ�Ķ�������

Kan.DelBattleInfo()
Kan.AddBattleInfo(1,1,false,false) --��Ǳ
Kan.AddBattleInfo(2,4,false,false) --ս������
Kan.AddBattleInfo(3,4,false,false) --���ݶ��� 
Kan.AddBattleInfo(4,1,false,false) --��Ǳ
Kan.AddBattleInfo(5,1,true,false)  --��Ǳ ҹս
--ÿ�����ս������ ���Ҫ�޸�Ϊ��Ļͼ��ʱ����Ҫ��

Kan.AddWay(427,333,135,200) --F N ��
--�ܶ�������M�� �����ö�����������Եõ�

--�����������������������������
--�����Ϊû����ϸ�Ķ������Ϊ�����������˸Ų�����
--�����Ϊû����ϸ�Ķ������Ϊ�����������˸Ų�����
--�����Ϊû����ϸ�Ķ������Ϊ�����������˸Ų�����
count = 2
--�������� ����Ļ�4�λ������ͼ Ϊ�˱����Ϊ������ ����3�ĳ�������ؿ���lv_change����

lv_change = false
--����ű�����Ա��ģ�������һᵼ�������˽��ȣ���������
--��Ҫ���������� ���Ϊtrue����Զ��ӱ��л��������лر��������ȣ�����֤������E4
--������Ѿ��̹���E4����ô���������ó�false������������д....
--�����������������������������

--kan_support_boss_id = 4
--Boss֧Ԯ����ID ����Ҫ�Ļ�����ǰ���--ע�͵� ��E4����Ҫ

    kan_support_id = 3
--����֧Ԯ����ID ����Ҫ�Ļ�����ǰ���--ע�͵� ��E4����Ҫ

---------------------------------------------------------------------------------
--����������޸�Ϊ��Ļͼ��ʱ�����Ҫ��

team_id = 12
--�����Ķ���ID,���Ͻ��ӵĻ�����д12

use_way = true
--�Ƿ�ʹ���ܶ��� ��ͼ�������Ҫʹ���ܶ��� ��дfalse

map_id = 4
--������ͼE3�������и�Ϊ����ͼ�̴�

map_battle_count = 5
--�ڵ�ͼ�н��м������ս�� ����Ҳ���� ���ǲ����� ���˵�Bossǰ�ͳ����� 
--(��������Դ����ܶ��㻹�����еȲ�ս���ĵ������)

--Base.SetConfig("Sleep+?",100) --������ʱ�������1-100
---------------------------------------------------------------------------------

function SupplyAllStringMatch(_str)
    local t2 = { string.match(_str , "^(-?%d+),(-?%d+),(-?%d+),(-?%d+)|(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)") }
    --�����ص�����ƥ�䵽����
    t = {}

    for key, value in pairs(t2) do  
        table.insert(t,tonumber(value))
    end  --תΪ��ֵ
    Base.Print(string.format("����״̬:%d %d %d %d",t[1],t[2],t[3],t[4]))
    Base.Print(string.format("��1���ӵ���״̬:%d %d %d %d %d %d",t[5],t[6],t[7],t[8],t[9],t[10]))
    Base.Print(string.format("��2���ӵ���״̬:%d %d %d %d %d %d",t[11],t[12],t[13],t[14],t[15],t[16]))
    return t
end

function NeedRepair(_t) --�ж��Ƿ���Ҫ����
    if t[5]>0 or t[6]>0 or t[7]>0 or t[8]>0 or t[9]>0 or t[10]>0 then
        return true
    end
    if t[11]>0 or t[12]>0 or t[13]>0 or t[14]>0 or t[15]>0 or t[16]>0 then
        return true
    end
    
    return false
end

function E4LvChange() --�ж��Ƿ���Ҫ����
	if lv_change == false then
		return false
	end
	
	Win.Print('���ý���...')
	Kan.WaitHome(2000)
	Base.Click(204,247)		
	while Base.IsColor(454,243,4170070) == false and Base.IsColor(196,303,199) == false do
		Base.Sleep(500) --�ȴ���������ʱ��
	end
	Base.Click(245,274)
	while Base.IsColor(599,121,5744383) == false do
		Base.Sleep(500) --�ȴ���������ʱ��
	end
	Base.Sleep(500) --�ȴ���������ʱ��
	Base.Click(709,450) --�ͼ
	Base.Sleep(2000)
	Base.Click(422,278) --��ҳ
	Base.Sleep(2000)
	
	if Base.IsColor(757,169,255) == true then
		Win.Print('����������...��ʼս��������')
		Base.Click(15,12) --��ĸ��
		Kan.WaitHome(2000)
		return false
	end
	
	Base.Click(649,206) --E4
	while Base.IsColor(476,61,10262315) == false do
		Base.Sleep(500) --�ȴ���ս�ƻ��������ʱ��
	end
	Base.Sleep(500) 
	Base.Click(520,62) --��ս�ƻ�
	Base.Sleep(2000) 
	Base.Click(363,267) --��ѡһ������ս

	while Base.IsColor(515,296,10460707) == false do
		Base.Sleep(500) --�ȴ��ƻ����ȷ��
	end
	Base.Sleep(500) 
	Base.Click(508,298) --ȷ��

	while Base.IsColor(716,444,7039266) == false do
		Base.Sleep(500) --�ȴ��ƻ����ȷ��
	end
	Base.Sleep(500) 
	Base.Click(461,116) --�˳���սȷ��

	while Base.IsColor(600,121,5744895) == false do
		Base.Sleep(500) --�ȴ��˳����
	end

	Base.Sleep(500)
	Base.Click(649,206) --E4

	while Base.IsColor(476,61,10262315) == false do
		Base.Sleep(500) --�ȴ���ս�ƻ��������ʱ��
	end
	Base.Sleep(500) 
	Base.Click(520,62) --��ս�ƻ�
	Base.Sleep(2000) 
	Base.Click(498,235) --����ս

	while Base.IsColor(515,296,10460707) == false do
		Base.Sleep(500) --�ȴ��ƻ����ȷ��
	end
	Base.Sleep(500) 
	Base.Click(508,298) --ȷ��

	while Base.IsColor(716,444,7039266) == false do
		Base.Sleep(500) --�ȴ��ƻ����ȷ��
	end
	Base.Sleep(500) 
	Base.Click(15,12) --��ĸ��
	Kan.WaitHome(2000)
	return true
end


E4LvChange()

for n = 1, count do --ѭ������
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
    
    if NeedRepair(t) == true then
        Win.Print('����/��/С�ƣ�ʹ�ý�������')
        
        --�������С�ƵĴ� 6�� ��Ǳͧ��Ĵ���ʹ��Ͱ����
        --�����𻵳̶�[����С��]�������Ͱѵ���������+1ȥ��
        Kan.RepairEx(12, 2 + 4 + 8, 2 + 4 + 8 )
    elseif t[1] == -1 then
        Win.Pop('�������� �ű�ֹͣ��',true)
        break
    end
    
    Kan.Sally(10, map_id) --����E3
    
	Base.SetConfig("LastBattleCount", 0)
    --��һ����\ս��4��\ʹ���ܶ���
    if Kan.BattleEx(team_id, map_battle_count , use_way) == false then
        LastBattleCount = Base.GetValue("LastBattleCount")
        if LastBattleCount ~= nil and LastBattleCount ~= "" then
            if tonumber(LastBattleCount) < map_battle_count then
                Win.Print('����Ȱ��')
            end
            min = (7 - tonumber(LastBattleCount)) * 1.1 
            Win.Print('ս����������..�ȴ�'..min ..'���ӻָ�ƣ���ٴ�...')
            Base.Sleep(1000 * 60 *  min) --�ȴ�ʱ��
        else
			if LastBattleCount == "" or LastBattleCount == "0" then
				Win.Print('����ʧ�ܣ����ڴ��ƴ���λװ������')
				Win.Pop('����ʧ�ܣ����ڴ��ƴ���λװ������')
				break
			else
				Win.Print('ս����������..�ȴ�24���ӻָ�ƣ���ٴ�...')
            	Base.Sleep(1000 * 60 *  6) --�ȴ�ʱ��
			end
        end 
    else
        LastBattleCount = Base.GetValue("LastBattleCount")
        if LastBattleCount ~= nil and tonumber(LastBattleCount) < map_battle_count then
            Win.Print('��һ�����콢����Ȱ��')
        end
        Win.Print('ս����������..�ȴ�3���ӻָ�ƣ���ٴ�...')
        Base.Sleep(1000 * 60 * 0.5) --�ȴ�ʱ��
    end
    Kan.WaitHome(2000)
	
	if n % 2 == 0 then
		--���ý���
		E4LvChange()
	end
	
    Base.Sleep(2000)
end

Win.Pop('�ű�ִ����ϣ�')