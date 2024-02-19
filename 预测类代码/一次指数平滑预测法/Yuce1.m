%一次指数平滑预测法
%%
x=[4.81 4.8 4.73  4.7 4.7 4.73 4.75 4.75 5.43 5.78 5.85 5.88 5.93];  %原始数据输入部分
yt=x'; n=length(yt);
alpha=[0.1 0.3 0.9]; m=length(alpha);                                %权重系数部分
yhat(1,1:m)=(yt(1)+yt(2))/2;                                         %初始值计算
for i=2:n
    yhat(i,:)=alpha*yt(i-1)+(1-alpha).*yhat(i-1,:);
end
yhat;
%%
%预测误差值计算
yhat1=alpha*yt(n)+(1-alpha).*yhat(n,:);                              %预测下一时刻的值
err=sqrt(mean((repmat(yt,1,m)-yhat).^2));                            %预测误差




