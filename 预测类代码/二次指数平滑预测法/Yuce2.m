%����ָ��ƽ��Ԥ�ⷨ
%%
x=[4.81 4.8 4.73  4.7 4.7 4.73 4.75 4.75 5.43 5.78 5.85 5.88 5.93];  %ԭʼ�������벿��
yt=x'; n=length(yt);
alpha=[0.9];                                                         %Ȩ��ϵ������
T=1;                                                                 %��һʱ����
st1(1)=yt(1);st2(1)=yt(1);                                    %��ʼֵ
for i=2:n
    st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
a=2*st1-st2;
b=alpha/(1-alpha)*(st1-st2);
%%
%Ԥ��ֵ����
yhat=a+b*T;                                              %Ԥ����һʱ�̵�ֵ
err=sqrt(mean((yt-yhat').^2));                            %Ԥ�����