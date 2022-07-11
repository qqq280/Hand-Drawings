function [X, Y, Radius]=GetCenterRadius(I)
%功能： 找到图片中太阳的圆心位置和半径大小
%做法：通过二值化把图片分为黑白两个部分，在把数值取反，黑白颠倒，用连通域开运算去除太阳中黑子的点，消除干扰，
%　　　在将图片变回原样，通过对每个像素点赋值，分别对Ｘ，Y求平均数来得到圆心。
% A=(I-min(I(:)))/(max(I(:))-min(I(:)));
% A=A*255;
% A=uint8(A);
% %imshow(A)
% Picture=im2bw(A,graythresh(A));
Picture = I;
NumPic=sum(sum(Picture~=0));%统计非零个数
[m,n]=size(Picture);      
%imshow(Picture)
TempPic=ones(m,1);
TempPic1 = ones(n,1);
Size=1:n;
TempPic_=TempPic*Size;%得到一个列向从1开始累加，行向相等的矩阵
Result=TempPic_.*Picture;%将圆上的点赋值
X=sum(sum(Result))/NumPic;
Size1 = 1:m; 
%Size1 = Size1';
TempPic1_=Size1'*TempPic1';      %求转置矩阵
Result=TempPic1_.*Picture;
Y=sum(sum(Result))/NumPic;
Radius=sqrt(NumPic/pi);%通过面积算半径，默认每个像素点的面积为1
end

