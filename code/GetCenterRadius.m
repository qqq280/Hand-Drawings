function [X, Y, Radius]=GetCenterRadius(I)
%���ܣ� �ҵ�ͼƬ��̫����Բ��λ�úͰ뾶��С
%������ͨ����ֵ����ͼƬ��Ϊ�ڰ��������֣��ڰ���ֵȡ�����ڰ׵ߵ�������ͨ������ȥ��̫���к��ӵĵ㣬�������ţ�
%�������ڽ�ͼƬ���ԭ����ͨ����ÿ�����ص㸳ֵ���ֱ�ԣأ�Y��ƽ�������õ�Բ�ġ�
% A=(I-min(I(:)))/(max(I(:))-min(I(:)));
% A=A*255;
% A=uint8(A);
% %imshow(A)
% Picture=im2bw(A,graythresh(A));
Picture = I;
NumPic=sum(sum(Picture~=0));%ͳ�Ʒ������
[m,n]=size(Picture);      
%imshow(Picture)
TempPic=ones(m,1);
TempPic1 = ones(n,1);
Size=1:n;
TempPic_=TempPic*Size;%�õ�һ�������1��ʼ�ۼӣ�������ȵľ���
Result=TempPic_.*Picture;%��Բ�ϵĵ㸳ֵ
X=sum(sum(Result))/NumPic;
Size1 = 1:m; 
%Size1 = Size1';
TempPic1_=Size1'*TempPic1';      %��ת�þ���
Result=TempPic1_.*Picture;
Y=sum(sum(Result))/NumPic;
Radius=sqrt(NumPic/pi);%ͨ�������뾶��Ĭ��ÿ�����ص�����Ϊ1
end

