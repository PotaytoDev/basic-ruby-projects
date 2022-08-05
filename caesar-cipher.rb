=begin 
  Define caesar_cipher(string, shift_factor, shift_direction)
    - Split string into an array of elements, each one containing a character
      from the string
    - Use #map on the character array
      - For each character in array, change it into its integer representation
        by calling the #ord method on them
      - Once the character has been converted into its integer representation,
        use value of shift_direction to determine whether to add or subtract
        the shift_factor from the integer representation of the character
          - A value of "right" for the shift_direction means that the value of
            shift_factor should be added to the value of the character's integer
            representation
          - On the other hand, a value of "left" means that the value should be
            subtracted instead
          - I need to determine what the values of "a", "A", "z", and "Z" are
            and use them to wrap back around when the shift_factor goes beyond
            either of those two boundaries
              - If the new value goes over the ending boundary ("z" or "Z"),
                the difference between the value and the ending boundary should
                be added to the value of the beginning boundary in order to
                correctly wrap back around the alphabet.
              - The same should be done if the new value goes under the
                beginning boundary ("a" or "A"), so that it can wrap around to
                the end of the alphabet.
      - Call the #chr method on the new value of the integer to convert it back
        into a character
      - The new array should now hold all of the new characters once the
        shift_factor and shift_direction have been applied to them
      - Lastly, I need to #join the array back into a string and return it
        from the function
=end