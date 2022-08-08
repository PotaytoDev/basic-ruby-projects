=begin
  Implement a method #stock_picker that takes in an array of stock prices, one
  for each hypothetical day. It should return a pair of days representing the
  best day to buy and the best day to sell. Days start at 0.

  > stock_picker([17,3,6,9,15,8,6,1,10])
  => [1,4]  # for a profit of $15 - $3 == $12
=end

def stock_picker(stock_prices_array)
  lowest_price = Float::INFINITY
  highest_price = 0
  current_profit = 0
  price_to_buy = Float::INFINITY
  price_to_sell = 0
  final_profit = 0

  stock_prices_array.each do |stock_price|
    if stock_price < lowest_price
      lowest_price = stock_price 
      highest_price = 0
      profit = 0
      next
    elsif stock_price > lowest_price
      if stock_price > highest_price
        highest_price = stock_price
      else
        next
      end
    end

    current_profit = highest_price - lowest_price

    if current_profit > final_profit
      price_to_buy = lowest_price
      price_to_sell = highest_price
      final_profit = current_profit
    end
  end

  puts "Buy at $#{price_to_buy} on day #{stock_prices_array.index(price_to_buy) + 1}"
  puts "Sell at $#{price_to_sell} on day #{stock_prices_array.index(price_to_sell) + 1}"
  puts "For profit of $#{price_to_sell} - $#{price_to_buy} == $#{final_profit} per stock"
  return [stock_prices_array.index(price_to_buy), stock_prices_array.index(price_to_sell)]
end

p stock_picker([17,3,6,9,15,8,6,1,10])