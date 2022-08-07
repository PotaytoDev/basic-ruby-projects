def caesar_cipher(string, shift_factor, shift_direction)
  character_array = string.split('')

  modified_character_array = character_array.map do |element|
    character_integer_value = element.ord

    shifted_character_integer_value = calculate_new_value(character_integer_value,
        shift_factor, shift_direction)

    shifted_character_integer_value.chr
  end

  puts modified_character_array.join
end

def wrap_around_boundaries(character_integer_value, lower_boundary, upper_boundary)
  # If character_integer_value goes over upper boundary, wrap back around to lower boundary
  # 1 is subtracted because wrapping back around counts as one step
  if character_integer_value > upper_boundary.ord
    (lower_boundary.ord + (character_integer_value - upper_boundary.ord).abs) - 1
  # If character_integer_value goes below lower boundary, wrap back around to upper boundary
  # 1 is added to account for the shifting that takes place by wrapping back around
  elsif character_integer_value < lower_boundary.ord
    (upper_boundary.ord - (character_integer_value - lower_boundary.ord).abs) + 1
  else
    character_integer_value
  end
end

def determine_boundaries(character_integer_value)
  boundaries = {}

  if (character_integer_value >= 'a'.ord && character_integer_value <= 'z'.ord)
    boundaries[:lower_boundary] = 'a'
    boundaries[:upper_boundary] = 'z'
  else
    boundaries[:lower_boundary] = 'A'
    boundaries[:upper_boundary] = 'Z'
  end

  boundaries
end

def calculate_new_value(character_integer_value, shift_factor, shift_direction)
  unless (character_integer_value >= 'A'.ord && character_integer_value <= 'Z'.ord) ||
      (character_integer_value >= 'a'.ord && character_integer_value <= 'z'.ord)
          return character_integer_value
  end

  boundaries = determine_boundaries(character_integer_value)

  case shift_direction
  when "right"
    character_integer_value += shift_factor
  when "left"
    character_integer_value -= shift_factor
  else
    character_integer_value
  end

  wrap_around_boundaries(character_integer_value, boundaries[:lower_boundary],
      boundaries[:upper_boundary])
end

def take_user_input()
  user_input = {}

  print "Enter the string you want to encode/decode: "
  user_input[:message] = gets.chomp

  print "Enter the shift factor: "
  user_input[:shift_factor] = gets.chomp.to_i

  print "Enter the shift direction: "
  user_input[:shift_direction] = gets.chomp

  user_input
end

user_input = take_user_input()
caesar_cipher(user_input[:message], user_input[:shift_factor], user_input[:shift_direction])