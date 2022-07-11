function [x,y]=Getrealsunspot(X,Y,X1,Y1)
%通过向量来求取黑子对于以太阳中心为原点的位置
a=[X Y];
b=[X1 Y1];
c=b-a;
x=c(1);
y=-c(2);
