%BP神经网络预测法
%%
clc,clear
a=[15.6	5.6	3.5	 25.5 22.9;             %数据输入
   27.8	4.3	1.0	 7.7  23.4;
   35.2	3.0	38.1 3.7  36.8;
   10.2	3.4	3.5	 7.4  22.0;
   29.1	33.2 1.6 24.0 6.4;
   10.2	11.6 2.2 26.7 29.4;
   35.4	4.1	1.3	 7.0  26.2];
a=a';
P=a([1:4],[1:end-1]);[PN,PS1]=mapminmax(P); %自变量的数据规格化到[-1,1]
T=a(5,[1:end-1]);[TN,PS2]=mapminmax(T);    %因变量的数据规格化到[-1,1]
net1=newrb(PN,TN);                          %训练RBF网络
x=a([1:4],end);xn=mapminmax('apply',x,PS1); %预测样本点自变量规格化
yn1=sim(net1,xn);y1=mapminmax('reverse',yn1,PS2);%求预测值，并将数据还原
delta1=abs(a(5,7)-y1)/a(5,7);               %计算RBF网络预测的相对误差
net2=feedforwardnet(4);                     %初始化BP网络，隐含层的神经元为4
net2=train(net2,PN,TN);                     %训练BP网络
yn2=net2(xn);y2=mapminmax('reverse',yn2,PS2);%求预测值，并将数据还原