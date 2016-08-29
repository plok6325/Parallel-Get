function [ df ] = get_hist_data( code )
%获取全部日线级别数据
symbol=code_to_symbol(code);
page=urlread(['http://api.finance.ifeng.com/akdaily/?code=',symbol,'&type=last']);
exp='(?<date>\d{4}\-\d{2}\-\d{2})\","(?<open>\d*\.\d*)\","(?<high>\d*\.\d*)\","(?<close>\d*\.\d*)\","(?<low>\d*\.\d*)\","(?<volumne>\d*\.\d*)\","(?<p_change>\S{5,6})\"';
df=regexp(page,exp,'names');
df=struct2table(df);
df=sortrows(df,'date','descend');
end

