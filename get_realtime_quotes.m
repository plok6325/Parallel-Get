function [ df ] = get_realtime_quotes( code )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if iscell(code)
for x=1:length (code)
    symbol{x}=code_to_symbol(code{x});
end
url=['http://hq.sinajs.cn/list=',strjoin(symbol,',')]
else
     symbol =code_to_symbol(code);
    url=['http://hq.sinajs.cn/list=',symbol];
end
quotes_page=urlread(url);
exp='var hq_str_s\S(?<code>\d{6})\W{2}(?<name>\w*\s*\w*)\,(?<open>\d*\.\d*)\,(?<pre_close>\d*\.\d*)\,(?<price>\d*\.\d*)\,(?<high>\d*\.\d*)\,(?<low>\d*\.\d*)\,\d*\.\d*\,\d*\.\d*\,(?<volumn>\d*)\,(?<amount>\d*)';
df=regexp(quotes_page,exp,'names');
df=struct2table(df);
end
