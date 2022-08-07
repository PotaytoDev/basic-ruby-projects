=begin
  Implement a method #stock_picker that takes in an array of stock prices, one
  for each hypothetical day. It should return a pair of days representing the
  best day to buy and the best day to sell. Days start at 0.

  > stock_picker([17,3,6,9,15,8,6,1,10])
  => [1,4]  # for a profit of $15 - $3 == $12
=end

=begin
  def stock_picker(stock_prices_array)
    lowest_price = infinity
    highest_price = 0
    current_profit = 0
    price_to_buy = infinity
    price_to_sell = 0
    final_profit = 0

    - Ideally, the day to buy stocks would be the day with the lowest price.
      - In order to find the lowest price, I can iterate through the array
        and store in the variable lowest_price the lowest price I've come across.
        - I need to compare the value of the current element to that which is
          stored in the variable lowest_price.
          - If current_value < lowest_price, lowest_price = current_value
              highest_price = 0
              profit = 0
              continue
          - If current_value > lowest_price:
            - Compare current_value to that stored in highest_price
              - If current_value > highest_price, highest_price = current_value
              - Else continue to next value
          - Calculate current_profit: highest_price - lowest_price
            - If current_profit > final_profit
                price_to_buy = lowest_price
                price_to_sell = highest_price
                final_profit = current_profit
            - Else, continue
=end