=begin
  Assignment

  Build a method #bubble_sort that takes an array and returns a sorted array.
  It must use the bubble sort methodology (using #sort would be pretty
  pointless, wouldn’t it?).

  > bubble_sort([4,3,78,2,0,2])
  => [0,2,2,3,4,78]
=end

def bubble_sort(number_array)
  current_index = 0
  number_of_iterations_needed = number_array.length - 1
  number_of_swaps = 0

  while number_of_iterations_needed > 0
    if number_array[current_index] > number_array[current_index + 1]
      temp = number_array[current_index]
      number_array[current_index] = number_array[current_index + 1]
      number_array[current_index + 1] = temp
      number_of_swaps += 1
    end

    if current_index + 1 == number_of_iterations_needed
      break if number_of_swaps == 0

      number_of_iterations_needed -= 1
      current_index = 0
      number_of_swaps = 0
      next
    end

    current_index += 1
  end

  number_array
end

p bubble_sort([4, 3, 78, 2, 0, 2, 1, 3, 90, 3])