clear all
close all
path = 'D:\云台黑子数据JPG格式\1978\11\'; %可自行调整
file_list = dir([path, '*.JPG ']); 
res = size(file_list);
Result = [];
list_name=[];
for i = 1:res(1)
file_name = [path, file_list(i).name];
Image = imread(file_name);
[X,Y,Radius,result] = GetCentre(Image);
XYR1 = result;

Image1=rgb2gray(Image);
thresh = graythresh(Image1)*1.2;%图片不一样可能需要修改
I = im2bw(Image1,thresh);
%I = XYR-I;
I=~I;
I = I.*XYR1;
I = bwareaopen(I,500);
L = bwlabel(I);
STATS = regionprops(L,'all') ;
n=size(STATS);
for j=1:n(1)
    if STATS(j).Area>20000
        L(find(L==j))=0;
    end
    if STATS(j).Eccentricity>0.7
        L(find(L==j))=0;
    end
end
L = bwlabel(L);
img_reg = regionprops(L ,  'area', 'boundingbox');
rects = cat(1,  img_reg.BoundingBox);
if isempty(rects)
    continue;
end
for q = 1:size(rects, 1)
    bb{q} = imcrop(Image,rects(q, :));
end
for q = 1:size(rects, 1);
    aa=bb{q};
%     [X3,Y3,SubArea,L2]=Centroid_coordinates(aa,q,X,Y,rects);

aa = rgb2gray(aa);
%     aa = double(aa);
%     aa=(aa-min(aa(:)))/(max(aa(:))-min(aa(:)));
    temp = aa(1:20,:);
    T2 = mean(temp(:));
    %T = thresh*0.4;

    result = im2bw(aa,T2/255);
    result = imfill(~result,'holes');
    result = ~result;
    
    stats = regionprops(~result, 'basic');

    thr = [stats.Area];
   % if isempty(thr)
   % continue;
    %end
    thr = max(thr);
    result = bwareaopen(~result,thr-1);
    L2 = result;
    result = ~result;
    stats = regionprops(~result, 'All');
    centroids = cat(1, stats.Centroid);%找到质心的坐标
    SubArea = stats.Area;
    Perimeter2 = stats.Perimeter;
    X1=centroids(1);
    Y1=centroids(2);
    X2=X1+rects(q,1);
    Y2=Y1+rects(q,2);
    [X3,Y3]=Getrealsunspot(X,Y,X2,Y2);
    %X3 = -X3;
    [Year,Month,Day,Hour,Minute,name]=get_YMDHM_by_YNpicName(file_name);
    % 太阳的三个关键参数
    [B0,L0,P]=GetB0L0PbyDate(Year,Month,Day,Hour,Minute);
    A=[cos(-P/180*pi),-sin(-P/180*pi);sin(-P/180*pi),cos(-P/180*pi)]*[X3;Y3];
    Xa=A(1);
    Ya=A(2);
    appdiam= 32/60+35/3600;
% 求解黑子的经纬度（相对于L0）
    [Bp,Lp]=GetBLbyXYPBLR(Xa,Ya,P,B0,L0,Radius,appdiam);
    %[Sub2Area,L1]=GetSubAreaAndPerimeter(aa,L2);
    
    gray = aa;

% figure
% subplot(1,3,1)
% imshow(gray,[])
%二值化 或者 计算边缘

thresh1 = graythresh(gray);  
bw = imbinarize(gray,thresh1);
bw = ~bw.*~result;
bw = ~bw;
ll = bwperim(~result);
    se=strel('disk',10');
    kk = imdilate(ll,se);
    kk = ~kk;
    bw = kk.*~bw;
    bw = ~bw;
%将bw取反后计算连通域2
L = bwlabel(~bw);
STATS2 = regionprops(L,'All');%STATS中含有所有(All)连通域的properations
n=size(STATS2);
    Sub2Area = [STATS2.Area];
    Sub2Area = sum(Sub2Area(:));
    Perimeter1 = [STATS2.Perimeter];
    Perimeter1 = sum(Perimeter1(:));
    L1 = ~L;
    SubArea=AreaConversion(Bp,Lp,SubArea);
    Sub2Area=AreaConversion(Bp,Lp,Sub2Area);
    
    SubArea = SubArea - Sub2Area;
    ratio = SubArea/Sub2Area;
    
    subplot(1,3,1)
    imshow(aa,[]);
    %title(name);
    subplot(1,3,2)
    imshow(L1)
    %title(['Area1:',Areas1])
    subplot(1,3,3)
    imshow(~L2);

    Frame=getframe(figure(1));
    nn=int2str(q);
    if(length(nn)==1)
        nn = ['00',nn];
    end
    if(length(nn)==2)
        nn = ['0',nn];
    end
    mm = [name,nn];
    filename=['G:\save_picture\',mm,'.jpg'];
    if(ratio ~= Inf & ratio<15 )
    imwrite(Frame.cdata,filename);
    list_name=[list_name;mm];
    Result = [Result;Bp,Lp,Sub2Area,SubArea,ratio,Perimeter1,Perimeter2];
    end
end

end