function [x,y]=Getrealsunspot(X,Y,X1,Y1)
%ͨ����������ȡ���Ӷ�����̫������Ϊԭ���λ��
a=[X Y];
b=[X1 Y1];
c=b-a;
x=c(1);
y=-c(2);
