require("\\Lua\\changebynew")
require("\\Lua\\ztaskVer2")
require("\\Lua\\����Զ��")
local ssta=0
��������=20
nss=3
n=1
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

count = 80

team_id = 1
--�����Ķ���ID,���Ͻ��ӵĻ�����д12

use_way = true
--�Ƿ�ʹ���ܶ��� ��ͼ�������Ҫʹ���ܶ��� ��дfalse

map_id = 3
--������ͼE1�������и�Ϊ����ͼ�̴�

map_battle_count = 4
--�ڵ�ͼ�н��м������ս�� ����Ҳ���� ���ǲ����� ���˵�Bossǰ�ͳ����� 
--(��������Դ����ܶ��㻹�����еȲ�ս���ĵ������)

function �̴�()
if n>�������� then return false end
a = "��ʼ��:%d��"
    Win.Print(a:format(n))
	���չ��(ssta+1)
	ssta=(ssta+1)%nss
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
        Kan.RepairEx(6, 16, 2 + 4 + 8 )

    elseif t[1] == -1 then
        Win.Pop('�������� �ű�ֹͣ��',true)
		return
    end

    Kan.Sally(10, map_id) --����E4


    --��һ����\ս��4��\ʹ���ܶ���
    if Kan.BattleEx(team_id, map_battle_count , use_way) == false then
        LastBattleCount = Base.GetValue("LastBattleCount")
        Win.Print(LastBattleCount)    
    end
	n=n+1
    Kan.WaitHome(2000)
end
while true do 
	�̴�()
	����һ��Զ��()
	Base.Sleep(1000*2)
end


