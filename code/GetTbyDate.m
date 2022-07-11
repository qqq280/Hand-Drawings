function T=GetTbyDate(Year,Month,Day)
% 计算儒略日
% 输入参数：公历年，月，日(日期可以带小数点)
% 输出参数：以儒略日表示的观测时间
% 公式参考：http://www.360doc.com/content/17/0814/11/460866_679072040.shtml
if Month<=2
    Year=Year-1;
    Month=Month+12;
end
A=floor(Year/100);
B=2-A+floor(A/4);

T=floor(365.25*(Year+4716))+floor(30.6001*(Month+1))+Day+B-1524.5;
% 测试代码
% 1858年11月17日世界时0时的儒略日数为：2400000.5
% 2000年1月1日世界时12时的儒略日数为：2451545.0
% 1992年10月13日零时的儒略日数为：2448908.5

% T=(GetTbyDate(2000,1,1.5));
