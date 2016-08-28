function [ today_tick ] = get_today_ticks( stock )
%获取当日分笔明细数据
%  page = http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_Transactions.getAllPageTime?date=2016-08-25&symbol=sz000002 
% 
symbol=code_to_symbol(stock);
today=datestr(date,'yyyy-mm-dd');
today_page=['http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_Transactions.getAllPageTime?date=',today,'&symbol=',symbol ];
page=urlread(today_page);
exp='page:\d*';
page_result=regexp(page,exp,'match');
last_page=page_result{end};
today_tick=[];
for pNo=1:str2num(last_page(6:end));
this_page_tick= today_ticks(symbol,today,pNo);
today_tick=[today_tick this_page_tick];
display([num2str(100*pNo/str2num(last_page(6:end))),'%'])
end
end

