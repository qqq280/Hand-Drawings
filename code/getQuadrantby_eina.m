function eina_1=getQuadrantby_eina(eina)
% 根据度数判断所在象限
% 1,2,3,4分别代表一，二，三，四象限
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