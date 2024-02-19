%��ɫ�����ȷ���ԭʼ����
%%

%�������ݣ�ÿ������Ϊһ�У�ĸ�����ڵ�һ��
gdp=[
1988 386 839 763;
2061 408 846 808;
2335 422 960 953;
2750 482 1258 1010;
3356 511 1577 1268;
3806 561 1893 1352];

%��ͼ
[n ,m]= size(gdp);
for i = 1:m
    plot(gdp(:,i), 'x-');
    hold on 
end
hold off
xlabel('���')
ylabel('����Ԫ')
legend({'����������ֵ','��һ��ҵ','�ڶ���ҵ','������ҵ'})

%�Ա�������Ԥ����
y = gdp(:,1);
x = gdp(:,2:end);

x_norm = zeros(n ,m);
x_sum = 0;
for i = 1:m
    x_sum = sum(gdp(:,i));
    for j = 1:n
        x_norm(j, i) = gdp(j, i) / x_sum * n;
    end
    x_sum = 0;
end

%�����������и���ָ����ĸ���еĹ���ϵ��
x_concect = zeros(size(x));
for i = 1: length(x_concect(1,:))
    x_concect(:,i) = abs(x_norm(:, 1) - x_norm(:,i+1));
end
a = min(min(x_concect));
b = max(max(x_concect));

%�����ɫ�����ȣ�gamma��
rho = 0.5;
gamma = zeros(n, m-1);
for i = 1:m-1
    for j = 1:n
        gamma(j, i) = (a + rho * b)/(x_concect(j,i) + rho * b);
    end
end
ans = mean(gamma);
disp('���յõ��Ļ�ɫ�����ȷֱ��ǣ�')
disp(ans)