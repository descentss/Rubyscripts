def stock_picker(prices)
    best_days = [0,0]
    max_profit = 0;

    prices.each_with_index do |buy_price, buy_day|
        ((buy_day + 1)...prices.length).each do |sell_day|
            profit = prices[sell_day] - buy_price
            if profit > max_profit
                max_profit = profit
                best_days = [buy_day,sell_day]
            end
        end
    end
    best_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
