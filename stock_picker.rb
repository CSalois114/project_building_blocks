# Stock Picker

# Takes an array of daily stock prices and finds the range that would yield
# the maximum profit if you were to buy the stock at the beginning and sell
# at the end. For a price array of [10,1,5,7,6,1] the result would be [1,4]
# as buying in at a price of 1$ and selling at 6$ yields the largest return.

def stock_picker(price_arr)

    profit = 0
    
    # Handles edge case of first price being a low point
    if price_arr[0] < price_arr[1]
      if price_arr.max - price_arr[0] > profit
        profit = price_arr.max - price_arr[0]
        best_range = [0, price_arr.index(price_arr.max)]
      end
    end
  
    #finds low points and their max earning potential updating the best range as it goes
    index = 1 # index is stepped up each loop to keep up with the index of the price
    price_arr[1..-2].each do |price|
      remaining_prices = price_arr[index..-1]
      if price_arr[index - 1] > price && price_arr[index + 1] > price
        if remaining_prices.max - price > profit
          profit = remaining_prices.max - price
          best_range = [price_arr.index(price), remaining_prices.index(remaining_prices.max) + index]
        end
      end
      index +=1 # index stepper
    end
    
    puts "profit = #{profit}$"
    best_range
  end