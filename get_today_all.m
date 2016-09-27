function [df]=get_today_all()
df=[];
for pagenum=1:50;
page=urlread(['http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeData?num=80&sort=changepercent&asc=0&node=hs_a&symbol=&_s_r_a=page&page=',num2str( pagenum)]);
if strcmp(page,'null')
    
else 
exp='code:"(?<code>\d{6})\",name:"(?<name>\w*\s*\w*)",trade:"(?<price>\d*\.\d*|\d*)",pricechange:"(?<pricechange>\d*\.\d*|-\d*\.\d*)",changepercent:"(?<p_change>\d*\.\d*|-\d*\.\d*)",buy:"(?<buy1>\d*\.\d*|\d*)",sell:"(?<sell1>\d*\.\d*|\d*)",settlement:"(?<settlement>\d*\.\d*|\d*)",open:"(?<open>\d*\.\d*|\d*)",high:"(?<high>\d*\.\d*|\d*)\",low:"(?<low>\d*\.\d*|\d*)",volume:(?<volume>\d*\.\d*|\d*),amount:(?<amount>\d*\.\d*|\d*)';
%exp='var hq_str_s\S(?<code>\d{6})\W{2}(?<name>\w*\s*\w*)\,(?<open>\d*\.\d*|\d*)\,(?<pre_close>\d*\.\d*|\d*)\,(?<price>\d*\.\d*|\d*)\,(?<high>\d*\.\d*|\d*)\,(?<low>\d*\.\d*|\d*)\,\d*\.\d*\,\d*\.\d*\,(?<volumn>\d*\.\d*|\d*)\,(?<amount>\d*\.\d*|\d*)';
this_df=regexp(page,exp,'names');
df=[df this_df];
end 
end 
df=struct2table(df);
end 