function [X,Y,Radius,result] = GetCentre(I)
Image = I;
R=Image(:,:,1); G=Image(:,:,2); B=Image(:,:,3);
XYR=G-R>=20;
P = XYR;
se1=strel('disk',15);
%se2=strel('disk',5);
P=imclose(P,se1);
STATS_a = regionprops(P,'all') ;
temp = [STATS_a.Area];  
temp = max(temp);
result = bwareaopen(P,temp-1);

%XYR1=imopen(XYR1,se2);
% STATS_b = regionprops(XYR1,'all') ;
% temp1 = [STATS_b.Area];  
% temp1 = max(temp1);
% result = bwareaopen(XYR1,temp1-1);
pp = bwperim(result);
STATS_n = regionprops(pp,'all') ;
temp2 = [STATS_n.Area];  
temp2 = max(temp2);
result = removebwareaopen(pp,temp2-1);
result =  imfill(result,'holes');
result = bwareaopen(result,9000);
[X, Y, Radius] = GetCenterRadius(result);
end
