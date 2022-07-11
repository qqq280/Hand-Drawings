function [Year,Month,Day,Hour,Minute,name]=get_YMDHM_by_YNpicName(PicName)
% 根据云南天文台手绘黑子图名字得到年月日的信息

% YNpicNmae ='YSN1999-2015手绘图原始数据\2011\01\ynao_sd_20110104_0200_ye.bmp';
% PicName='result_picture\gong_igram_fd_20090905_223416.png';
% D:\picture\smdi_igram_fd_20040809_204800.fts
% if PicName(1)=='Y'
%     YNdate=split(PicName,'\');
%     YNdate=YNdate{4};
%     YNdate=split(YNdate,'_');
%     YNdate=[YNdate{3},YNdate{4}];
%     Year=str2num(YNdate(1:4)); %#ok<*ST2NM>
%     Month=str2num(YNdate(5:6));
%     Day=str2num(YNdate(7:8));
%     Hour=str2num(YNdate(9:10));
%     Minute=str2num(YNdate(11:12));
% else
%     YNdate=split(PicName,'\');
%     YNdate=YNdate{2};
%     YNdate=YNdate(7:end);
%     YNdate=split(YNdate,'_');
%     YNdate=[YNdate{3},YNdate{4}];
%     Year=str2num(YNdate(1:4)); %#ok<*ST2NM>
%     Month=str2num(YNdate(5:6));
%     Day=str2num(YNdate(7:8));
%     Hour=str2num(YNdate(9:10));
%     Minute=str2num(YNdate(11:12));
% end
%PicName= 'E:\云台黑子数据JPG格式\1965\10\ynao_sd_19651003_0315_11111.jpg';
% num = length(PicName);
% if num == 50
% Year=str2num(PicName(num-18:num-15));
%    Month=str2num(PicName(num-14:num-13));
%    Day=str2num(PicName(num-12:num-11));
%    Hour=str2num(PicName(num-9:num-8));
%    Minute=str2num(PicName(num-7:num-6));
%    name = PicName(24:num-11);
% end
% 
% if num == 51
% Year=str2num(PicName(num-19:num-16));
%    Month=str2num(PicName(num-15:num-14));
%    Day=str2num(PicName(num-13:num-12));
%    Hour=str2num(PicName(num-10:num-9));
%    Minute=str2num(PicName(num-8:num-7));
%    name = PicName(24:num-12);
% end
% 
% if num == 52
% Year=str2num(PicName(num-20:num-17));
%    Month=str2num(PicName(num-16:num-15));
%    Day=str2num(PicName(num-14:num-13));
%    Hour=str2num(PicName(num-11:num-10));
%    Minute=str2num(PicName(num-9:num-8));
%    name = PicName(24:num-13);
% end
% 
% if num == 53
% Year=str2num(PicName(num-21:num-18));
%    Month=str2num(PicName(num-17:num-16));
%    Day=str2num(PicName(num-14:num-14));
%    Hour=str2num(PicName(num-12:num-11));
%    Minute=str2num(PicName(num-10:num-9));
%    name = PicName(24:num-14);
% end
% if num == 54
% Year=str2num(PicName(num-22:num-19));
%    Month=str2num(PicName(num-18:num-17));
%    Day=str2num(PicName(num-16:num-15));
%    Hour=str2num(PicName(num-13:num-12));
%    Minute=str2num(PicName(num-11:num-10));
%    name = PicName(24:num-15);
% end
    num = length(PicName);
    Year=str2num(PicName(num-17:num-14));
    Month=str2num(PicName(num-13:num-12));
    Day=str2num(PicName(num-11:num-10));
    Hour=str2num(PicName(num-9:num-8));
    Minute=str2num(PicName(num-7:num-6));
    name = PicName(24:num-6);
end