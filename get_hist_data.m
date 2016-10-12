function [ df ] = get_hist_data( code,ktype)    
%获取全部历史数据
symbol=code_to_symbol(code);
if length(ktype)==1
    if strcmp(ktype,'m')||strcmp(ktype,'M')
        page=urlread(['http://api.finance.ifeng.com/akmonthly/?code=',symbol,'&type=last']);
    elseif strcmp(ktype,'w')||strcmp(ktype,'W')
        page=urlread(['http://api.finance.ifeng.com/akweekly/?code=',symbol,'&type=last']);
    elseif strcmp(ktype,'d')||strcmp(ktype,'D')
        page=urlread(['http://api.finance.ifeng.com/akdaily/?code=',symbol,'&type=last']);
    end
    
    exp='(?<date>\d{4}\-\d{2}\-\d{2})\","(?<open>\d*\.\d*|\d*)\","(?<high>\d*\.\d*|\d*)\","(?<close>\d*\.\d*|\d*)\","(?<low>\d*\.\d*|\d*)\","(?<volume>\d*\.\d*|\d*)\","(?<price_change>\d*\.\d*|-\d*\.\d*)\"';
    df=regexp(page,exp,'names');
    df=struct2table(df);
    df=sortrows(df,'date','descend');
else
    
    if strcmp(ktype,'15')||strcmp(ktype,'30')||strcmp(ktype,'60')
        page=urlread(['http://api.finance.ifeng.com/akmin?scode=',symbol,'&type=',ktype]);
    end
    exp='(?<timestamp>\d{4}\-\d{2}\-\d{2}\s*\d{2}:\d{2}:\d{2})\"\,\"(?<open>\d*\.\d*|\d*)\"\,\"(?<high>\d*\.\d*|\d*)\"\,\"(?<close>\d*\.\d*|\d*)\"\,\"(?<low>\d*\.\d*|\d*)\"\,(?<volume>\d*\.\d*|\d*)\,"(?<price_change>\d*\.\d*|-\d*\.\d*)\"';
    df=regexp(page,exp,'names');
    df=struct2table(df);
    df=sortrows(df,'timestamp','descend');
    
end

% if
% else
%     page=urlread(['http://api.finance.ifeng.com/akmin?scode=sz000002&type=',num2str(ktype)]);
end

