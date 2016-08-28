function [ df ] = get_tick_data( code,date )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 

symbol=code_to_symbol(code);
str= urlread(['http://market.finance.sina.com.cn/downxls.php?date=',date, '&symbol=',symbol]);
exp='(?<timestamp>\d{2}:\d{2}:\d{2})\s*(?<price>\d*\.\d{2})\s*(?<change>\S*)\s*(?<volumns>\d*)\s*(?<amount>\d*)';
df=regexp(str,exp,'names');

end

