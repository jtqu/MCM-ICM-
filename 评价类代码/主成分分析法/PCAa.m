%���ɷַ�����ԭʼ����
%%
% ��ȡԭʼ����
A=load('data.txt');
% ���ݱ�׼������
a=size(A,1);   % ��������
b=size(A,2);   % ��������
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i));  
end
% �������ϵ�����������ֵ����������
CM=corrcoef(SA);                           % �������ϵ������
[V, D]=eig(CM);                            % �������ϵ����������ֵ����������
%������ֵ��������
for j=1:b
    DS(j,1)=D(b+1-j, b+1-j);
end
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1));
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1));
end
% ѡ�����ɷּ����Ӧ����������
T=0.9;  % ���ɷ���Ϣ������
for K=1:b
    if DS(K,3)>=T
        Com_num=K;
        break;
    end
end
% ��ȡ���ɷֶ�Ӧ����������
for j=1:Com_num
    PV(:,j)=V(:,b+1-j);
end
% �������ɷֵ��ۺϵ÷�
new_score=SA*PV;

for i=1:a
    total_score(i,2)=sum(new_score(i,:));
    total_score(i,1)=i;
end
new_score_s=sortrows(total_score,-2);

% ������
disp('����ֵ�������ʣ�')
DS
disp('��ֵT��Ӧ�����ɷ���������������')
Com_num
PV
disp('���ɷַ�����')
new_score
disp('���ɷַ�������')
new_score_s















