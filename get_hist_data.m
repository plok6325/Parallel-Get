function [ df ] = get_hist_data( code,ktype)
%获取全部历史数据
symbol=code_to_symbol(code);
if ktype=='M'||ktype=='m'
    page=urlread(['http://api.finance.ifeng.com/akmonthly/?code=',symbol,'&type=last']);
elseif ktype=='W'||ktype=='w'
    page=urlread(['http://api.finance.ifeng.com/akweekly/?code=',symbol,'&type=last']);
elseif ktype=='D'||ktype=='d'
    page=urlread(['http://api.finance.ifeng.com/akdaily/?code=',symbol,'&type=last']);

end
 
exp='(?<date>\d{4}\-\d{2}\-\d{2})\","(?<open>\d*\.\d*)\","(?<high>\d*\.\d*)\","(?<close>\d*\.\d*)\","(?<low>\d*\.\d*)\","(?<volumne>\d*\.\d*)\","(?<p_change>\S{5,6})\"';
df=regexp(page,exp,'names');
df=struct2table(df);
df=sortrows(df,'date','descend');
% if 
% else
%     page=urlread(['http://api.finance.ifeng.com/akmin?scode=sz000002&type=',num2str(ktype)]);
end

