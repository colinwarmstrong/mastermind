class Logic

  def code_generator(code_length, color_array)
    code_array = []
    code_length.times do
      code_array << color_array.sample
    end
    code_array.join("")
  end

  def correct_color_counter(guess, code)
    guess_array = guess.split(//)
    code_array = code.split(//)
    color_count = 0
    guess_array.each do |guess_element|
      code_array.each_with_index do |code_element, index|
        if guess_element == code_element
          code_array[index] = nil
          color_count += 1
          break
        end
      end
    end
    color_count
  end

  def correct_position_counter(guess, code)
    guess_array = guess.split(//)
    code_array = code.split(//)
    position_count = 0
    guess_array.each_with_index do |element, index|
      if element == code_array[index]
        position_count += 1
      end
    end
    position_count
  end

end
