%һ��ָ��ƽ��Ԥ�ⷨ
%%
x=[4.81 4.8 4.73  4.7 4.7 4.73 4.75 4.75 5.43 5.78 5.85 5.88 5.93];  %ԭʼ�������벿��
yt=x'; n=length(yt);
alpha=[0.1 0.3 0.9]; m=length(alpha);                                %Ȩ��ϵ������
yhat(1,1:m)=(yt(1)+yt(2))/2;                                         %��ʼֵ����
for i=2:n
    yhat(i,:)=alpha*yt(i-1)+(1-alpha).*yhat(i-1,:);
end
yhat;
%%
%Ԥ�����ֵ����
yhat1=alpha*yt(n)+(1-alpha).*yhat(n,:);                              %Ԥ����һʱ�̵�ֵ
err=sqrt(mean((repmat(yt,1,m)-yhat).^2));                            %Ԥ�����




