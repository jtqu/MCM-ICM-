%BP������Ԥ�ⷨ
%%
clc,clear
a=[15.6	5.6	3.5	 25.5 22.9;             %��������
   27.8	4.3	1.0	 7.7  23.4;
   35.2	3.0	38.1 3.7  36.8;
   10.2	3.4	3.5	 7.4  22.0;
   29.1	33.2 1.6 24.0 6.4;
   10.2	11.6 2.2 26.7 29.4;
   35.4	4.1	1.3	 7.0  26.2];
a=a';
P=a([1:4],[1:end-1]);[PN,PS1]=mapminmax(P); %�Ա��������ݹ�񻯵�[-1,1]
T=a(5,[1:end-1]);[TN,PS2]=mapminmax(T);    %����������ݹ�񻯵�[-1,1]
net1=newrb(PN,TN);                          %ѵ��RBF����
x=a([1:4],end);xn=mapminmax('apply',x,PS1); %Ԥ���������Ա������
yn1=sim(net1,xn);y1=mapminmax('reverse',yn1,PS2);%��Ԥ��ֵ���������ݻ�ԭ
delta1=abs(a(5,7)-y1)/a(5,7);               %����RBF����Ԥ���������
net2=feedforwardnet(4);                     %��ʼ��BP���磬���������ԪΪ4
net2=train(net2,PN,TN);                     %ѵ��BP����
yn2=net2(xn);y2=mapminmax('reverse',yn2,PS2);%��Ԥ��ֵ���������ݻ�ԭ