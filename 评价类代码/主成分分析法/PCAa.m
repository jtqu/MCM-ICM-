%主成分分析法原始程序
%%
% 读取原始数据
A=load('data.txt');
% 数据标准化处理
a=size(A,1);   % 计算行数
b=size(A,2);   % 计算列数
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i));  
end
% 计算相关系数矩阵的特征值和特征向量
CM=corrcoef(SA);                           % 计算相关系数矩阵
[V, D]=eig(CM);                            % 计算相关系数矩阵特征值和特征向量
%对特征值降序排序
for j=1:b
    DS(j,1)=D(b+1-j, b+1-j);
end
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1));
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1));
end
% 选择主成分及其对应的特征向量
T=0.9;  % 主成分信息保留率
for K=1:b
    if DS(K,3)>=T
        Com_num=K;
        break;
    end
end
% 提取主成分对应的特征向量
for j=1:Com_num
    PV(:,j)=V(:,b+1-j);
end
% 计算主成分的综合得分
new_score=SA*PV;

for i=1:a
    total_score(i,2)=sum(new_score(i,:));
    total_score(i,1)=i;
end
new_score_s=sortrows(total_score,-2);

% 输出结果
disp('特征值及贡献率：')
DS
disp('阀值T对应的主成分数与特征向量：')
Com_num
PV
disp('主成分分数：')
new_score
disp('主成分分数排序：')
new_score_s















