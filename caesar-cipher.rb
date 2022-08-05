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

def wrap_around_boundaries(character_integer_value)
  # If character_integer_value goes over "z" boundary, wrap back around to "a"
  # 1 is subtracted because wrapping back around counts as one step
  if character_integer_value > 'z'.ord
    ('a'.ord + (character_integer_value - 'z'.ord).abs) - 1
  # If character_integer_value goes below "a" boundary, wrap back around to "z"
  # 1 is added to account for the shifting that takes place by wrapping back around
  elsif character_integer_value < 'a'.ord
    ('z'.ord - (character_integer_value - 'a'.ord).abs) + 1
  else
    character_integer_value
  end
end

def calculate_new_value(character_integer_value, shift_factor, shift_direction)
  unless (character_integer_value >= 'A'.ord && character_integer_value <= 'Z'.ord) ||
      (character_integer_value >= 'a'.ord && character_integer_value <= 'z'.ord)
          return character_integer_value
  end

  case shift_direction
  when "right"
    character_integer_value += shift_factor
  when "left"
    character_integer_value -= shift_factor
  else
    character_integer_value
  end

  wrap_around_boundaries(character_integer_value)
end

caesar_cipher("hello world", 1, "left")