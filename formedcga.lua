require("\\Lua\\changebynew")

--require("\\Lua\\formedcga")
S_changedbynew=true
--����֮ǰ���� include_formedcag=true
-- cgb(g)  --g={{n1,n2},{n1,n2},...}
--[[				hcg[]()
1��3Ǳͧ 2��3-3�������� 3��1-5BOSS
4:5Ǳͧ 5��3CL3DD 6��ˮ���Ϸ���
7:����ĸ�C�Ӳ�ꠡ�����! 8:�������ꠡ�6ca
9:ˮ�� 10:2-5 11:1-6 12:4-5
13:4-5նɱ 14:��ϰBB+5DD 15:��ϰBB +DD+SS +3CLT
16:3-5_1cl5DD 17:��ĸ��������
]]
--[[
ca:	7��� 20��� 21(lv8)��ӥ 22���
	25ĦҮ 28���� 36�ӹ� 39�� 40���
	65��Ҷ(lv4) 68���� 

cav:
	72���� 73��Ħ 81��Ұ 83��� 14���� 121��V
clt:
	19ľ�� 45���� 76��
cl:
	2��ĥ 4���� 5��ͨ 10�ǿ� 12���� 32��ʮ��
	34��ĥ 50����Ұ 52��� 53�ܴ� 62aww 63��ŭ  
	75Ϧ�� 89�Ƅ�
SS;	
	46 i166 58��500 
	103��58 84��8  96��19 
ssv:
	67��58�� 70��8�� 93��19�� 
cv:
	16��� 17��� 38���� 56���� 60�Ӻ� 82��� 85��� 91����
	102��� 104����2�� 101�Ӻ�2��
clv:
	29��ӥ 23ǧ�����  37��ӥ 26RJ 27 ǧ��� 124���
BB:
	8��� 30�� 49��� 51���
	18½�� 97����
	98��� 106��� 110BSM 113���2�� ע���źܿ������SS��С
	87Littorio 92Roma
BBV:
	35���� 44���� 57ɽ�� 43��ɣ
DD:
	64���� 66ѩ�� 
	9�� 13�� 1�� 24�� 
	31ʱ�� 41��ѩ 79��˪ 47���� 
	48�貨 11Ϧ�� 
	15���� 6���� 3��ѩ 54亷� 74���� 77î�� 78���� 79��˪ 86�߲� 55����
	6���¡�33�w�¡�42���� 59�ַ� 69���� 94ʱ��� 95���� 
	54亷�  71���� 114��˪ 61��� 80�ȷ� 88ϼ 100����
	107��˪ 108ɽ��  111���� 112��ѩ 126���� 115���� 109z1
������
	99��ʯ 90�����
]] -- 

hcg={
[0]=function() return Win.Print("notdefined") end,
function() return cgall({67,46,58}) end, -- 3Ǳͧ
function() return cgall({30,29,27,23,76,19}) end, --3-3��������
function() return cgall({27,1,9,35}) end, --1-5BOSS
function() return cgall({70,96,103,46,58}) end, --5Ǳͧ
function() return cgall({5,62,52,64,66,31}) end,-- 3CL3DD���³�:ˮ��ս�ӣ�
function() return cgall({97,44,43,72,20,52}) end, -- ˮ���Ϸ���
function() return cgall({43,56,60,19,31,79}) end, -- ����ĸ�C�Ӳ�ꠡ�����!
function() return cgall({68,22,20,72,73,7}) end, -- �������ꠡ�6ca 2Cav��һ��Ͱ
function() return cgall({48,22,62,64,66,31}) end, -- ˮ�� DD�콢+CACL3DD cav����
function() return cgall({29,72,73,45,11,48}) end, --2-5
function() return cgall({62,31,66,64,79,41}) end,  --1-6
function() return cgall({73,43,7,20,56,16}) end , --4-5
function() return cgall({98,106,43,110,56,60}) end, --4-5նɱ
function() return cgall({106,48,11,31,64,66}) end,  --��ϰBB+5DD
function() return cgall({106,64,70,19,45,76}) end,   --��ϰBB +DD+SS +3CLT
function() return cgall({62,48,31,11,64,66}) end,   --3-5 1CL5DD ,����15.7
function() return cgall({16,56,60,20,22,25}) end  --��ĸ��������(3-5,381ZK)
}
ss2={ -- 2SS����

[0]=function() return cgall({67,96}) end, 
function() return cgall({70,103}) end, 
function() return cgall({93,58}) end, 
function() return cgall({67,46}) end, 
function() return cgall({70,103}) end, 
function() return cgall({93,70}) end, 
function() return cgall({67,93}) end,
function() return cgall({93,67}) end
}

function Զ��()
cgall({74,77,78,86},4)
cgall({10,6,3,54},3)
cgall({34,13,15,107,108},2)
end


function E3()
cgall({43,35,24,47,1,59})
cgall({5,7,68,9,64,15},2)
end
function E4()
cgall({90,102,18,60,17,56})
cgall({62,110,25,45,79,31},2)
end
function ZY()
cgall({11,107,8,30,17,38},3)
cgall({48,31,87,92,104,60},4)
end
if include_formedcag==nil then  ---���ڵ�ǰ�ű�ִ��
E4()
end