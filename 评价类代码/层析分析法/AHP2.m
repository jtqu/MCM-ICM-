%层次分析法程序
%%
%准则层和方案层的程序
b1=[1	1/2	1/3	1/6
2	1	1/2	1/3
3	2	1	1/2
6	3	2	1];
[x,y]=eig(b1);
eigenvalue=diag(y);                  %提取y矩阵的对角值
lamda=eigenvalue(1);
cil=(lamda-4)/3;
crl=cil/0.9;                          %层次单排序一致性检验
w21=x(:,1)/sum(x(:,1))                %准则层权值