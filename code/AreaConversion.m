function Area=AreaConversion(Bp,Lp,preArea)
% 对求出的像素面积做投影矫正

% radii=150/2;
radii=2086;
% Xa=-25.94;
% Ya=-32.19;
% [B0,L0,P]=GetB0L0PbyDate(2008,6,13,0,30);
% [Bp,Lp]=GetBLbyXYPBLR(Xa,Ya,P,B0,L0,radii,31/60+32.8/3600);
% preArea=50;
Area=preArea*10^6/(2*pi*radii*radii*cos(Bp*pi/180)*cos(Lp*pi/180));
end