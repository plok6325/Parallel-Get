function [ this_page_tick ] = today_ticks(symbol,today,pageNo)
% 获取当日 这只股票 page 上的价格没
%price = http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradedetail.php?symbol=sz000002&date=2016-08-26&page=1
this_page=urlread(['http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradedetail.php?symbol=',symbol,'&date=',today,'&page=',num2str(pageNo)]);
exp='(?<timestamp>\d{2}:\d{2}:\d{2})\W{2}th\W{2}td\W(?<price>\d*\.\d*|\d*)';
this_page_tick=regexp(this_page,exp,'names');
end

