--Զ��ʱ���
--2�� 30min      5:  90min     21:  140min       ��ʽ��60*min         os.time()��λ���룬ע��
--Base.SetConfig("Sleep+?",800)
--��һ��Զ��ʱ�䣬��ʼ��
--��1��ʾ��δ��ʼ
require("\\Lua\\ztaskVer2")
yzt1=os.time()-1+60*55
yzt2=os.time()-1+60*21
yzt3=os.time()-1+60*0
--Զ��Ŀ��               21��{3,5}140min   37��{5,5}165min   38:{5,6}175min   
k2_conquest = {3,5}
k3_conquest = {1,5}
k4_conquest = {1,2}  --{3,5}
--Զ����ʱ����
hs1=60*140  --17.5
hs2=60*90 --40
--hs3=60*140
hs3=60*30  --30
en1=true
en2= true
en3=true

--���������
men =1 ------��������
number_of_tasks = 2 -------��������
task_id = 0		------����ID����0��ʼ

local np=0
--
--===============

function td() --n-delaytime-akm
	n=0
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))
	delaytime= math.random(20,80)
	if (n+1)%12 == 0 then 
              	delaytime=delaytime+360
              end
	delaytime=60*2.2+delaytime          ----------2��������
	akm = "Random_Delay:%.2f��������"
	Win.Print(akm:format(delaytime/60))
	Base.Sleep(1000*delaytime) 
	n=n+1
end

-----------------
function dsyz()                    --��ʱԶ��
    local  ct=os.time()    --CurrenTime
      Win.Print("Զ���ж�")
      ak = "����ʱ��:%d��"
	Win.Print(ak:format(ct))
      if((en1 and ct>=yzt1) or (en2 and ct>=yzt2) or (en3 and ct>=yzt3) ) then --����Ƿ�Ӧ��ִ��Զ�����
            ---------------------------------------------------------
            Base.InitHWND() --���鳤���ܵĽű����� �������ɫ���ж��쳣

	ak = "Զ����:%d��"
	Win.Print(ak:format(np))
	-----------------------
	--m()
-----------------------------
	��ʼռ��() ------###########################################
	ret = Զ��.�ջ�() 
	--ȫ���ջ� ���Զ�����һ�γ���������ĸ����ˢ�³���״̬

	Base.Sleep(2000)

	a,b,c,d = ����All.ִ��() --ִ��1234���ӵĲ���
	Win.Print("������� ����Զ��")


	if b ~= -3 and en1 then --�жϵڶ�ս�Ӳ���Զ��״̬
	Զ��.ִ��(2,k2_conquest[1],k2_conquest[2]) --2
    yzt1=os.time()+hs1
	end

	if c ~= -3 and en2 then
	Զ��.ִ��(3,k3_conquest[1],k3_conquest[2]) --�|������2
    yzt2=os.time()+hs2
	end

	if d ~= -3 and en3 then
	Զ��.ִ��(4,k4_conquest[1],k4_conquest[2]) --�����o�l�΄�
    yzt3=os.time()+hs3
	end
	np=np+1
	����ռ��() ---###############################
	Win.Print("����Զ�����")

      end
end


---=======
for k=0,10000 do
      dsyz()
      td() --pp2+���Ӽ��
end
����ռ��()