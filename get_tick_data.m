function [ table ] = get_tick_data( code,date )
%
symbol=code_to_symbol(code);
str= urlread(['http://market.finance.sina.com.cn/downxls.php?date=',date, '&symbol=',symbol]);
exp='(?<timestamp>\d{2}:\d{2}:\d{2})\s*(?<price>\d*\.\d*)\s*(?<change>\S*)\s*(?<volumns>\d*)\s*(?<amount>\d*)';
stru=regexp(str,exp,'names');
table=struct2table(stru);
 if isempty(stru)
 display('无当日数据')
 end
end

