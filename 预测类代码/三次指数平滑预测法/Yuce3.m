%三次指数平滑预测法
%%
x=[4.81 4.8 4.73  4.7 4.7 4.73 4.75 4.75 5.43 5.78 5.85 5.88 5.93];  %原始数据输入部分
yt=x'; n=length(yt);
alpha=[0.9];                                                         %权重系数部分
T=1;                                                                 %下一时刻数
st1_0=mean(mean(yt(1:3)));st2_0=st1_0;st3_0=st1_0;                   %初始值
st1(1)=alpha*yt(1)+(1-alpha)*st1_0;
st2(1)=alpha*st1(1)+(1-alpha)*st2_0;
st3(1)=alpha*st2(1)+(1-alpha)*st3_0;
for i=2:n
    st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
    st3(i)=alpha*st2(i)+(1-alpha)*st3(i-1);
end
st1(1)=st1_0;                                         %合并初始值
st2(1)=st2_0;
st3(1)=st3_0;
a=3*st1-3*st2+st3;
b=0.5*alpha/(1-alpha)^2*((6-5*alpha)*st1-2*(5-4*alpha)*st2+(4-3*alpha)*st3);
c=0.5*alpha^2/(1-alpha)^2*(st1-2*st2+st3);
%%
%预测值计算
yhat=a+b+c;                                              %预测下一时刻的值
err=sqrt(mean((yt-yhat').^2));                            %预测误差