function eina_1=getQuadrantby_eina(eina)
% ���ݶ����ж���������
% 1,2,3,4�ֱ����һ����������������
eina_=mod(eina,360);
eina_1=[];
if eina_>0 && eina_<=90
    eina_1=1;
end
if eina_>90 && eina_<=180
    eina_1=2;
end
if eina_>180 && eina_<=270
    eina_1=3;
end
if eina_>270 && eina_<=360
    eina_1=4;
end
end