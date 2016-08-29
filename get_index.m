function [ df ] = get_index( input_args )
%获取即时指数行情
web=urlread('http://hq.sinajs.cn/rn=xppzh&list=sh000001,sh000002,sh000003,sh000008,sh000009,sh000010,sh000011,sh000012,sh000016,sh000017,sh000300,sz399001,sz399002,sz399003,sz399004,sz399005,sz399006,sz399100,sz399101,sz399106,sz399107,sz399108,sz399333,sz399606');
 exp='var hq_str_s\S(?<code>\d{6})\W{2}(?<name>\w*\s*\w*|?<name>\w*\s\w*\s\w*)\,(?<open>\d*\.\d*)\,(?<pre_close>\d*\.\d*)\,(?<price>\d*\.\d*)\,(?<high>\d*\.\d*)\,(?<low>\d*\.\d*)\,(\d*\.\d*|0)\,(\d*\.\d*|0)\,(?<volumn>\d*)\,(?<amount>\d*)';
 df=regexp(web,exp,'names');
 exp='var hq_str_s\S(?<code>\d{6})\W{2}(?<name>\w*\s\w*\s\w*)\,(?<open>\d*\.\d*)\,(?<pre_close>\d*\.\d*)\,(?<price>\d*\.\d*)\,(?<high>\d*\.\d*)\,(?<low>\d*\.\d*)\,(\d*\.\d*|0)\,(\d*\.\d*|0)\,(?<volumn>\d*)\,(?<amount>\d*)';
 df2=regexp(web,exp,'names');% 新指数有bug
 df=[df df2];
df=struct2table(df);
end

