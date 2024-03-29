%K-means聚类分析法原始程序
%%
%% 数据准备和初始化
clc
clear
x=[0 0;1 0; 1 1; 2 1;3 4;4 4; 5 7;7 7; 6 4; 6 7; 7 8];
z=zeros(2,2);
z1=zeros(2,2);
z=x(1:2, 1:2);
%% 寻找聚类中心
while 1
    count=zeros(2,1);
    allsum=zeros(2,2);
    for i=1:10 % 对每一个样本i，计算到2个聚类中心的距离
        temp1=sqrt((z(1,1)-x(i,1)).^2+(z(1,2)-x(i,2)).^2);
        temp2=sqrt((z(2,1)-x(i,1)).^2+(z(2,2)-x(i,2)).^2);
        if(temp1<temp2)
            count(1)=count(1)+1;
            allsum(1,1)=allsum(1,1)+x(i,1);
            allsum(1,2)=allsum(1,2)+x(i,2);
        else
            count(2)=count(2)+1;
            allsum(2,1)=allsum(2,1)+x(i,1);
            allsum(2,2)=allsum(2,2)+x(i,2); 
        end
    end
    z1(1,1)=allsum(1,1)/count(1);
    z1(1,2)=allsum(1,2)/count(1);
    z1(2,1)=allsum(2,1)/count(2);
    z1(2,2)=allsum(2,2)/count(2);
    if(z==z1)
        break;
    else
        z=z1;
    end
end
%% 结果显示
disp(z1);% 输出聚类中心
plot( x(:,1), x(:,2),'k*',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.5,0.5,0.5])
hold on
plot(z1(:,1),z1(:,2),'ko',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.5,0.5,0.5])
set(gca,'linewidth',2) ;
xlabel('特征x1','fontsize',12);
ylabel('特征x2', 'fontsize',12);
title('K-means分类图','fontsize',12);

