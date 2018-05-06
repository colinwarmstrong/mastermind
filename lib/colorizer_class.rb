class Colorizer

  def colorize_flow(string, level)
    guess_array = string.split(//)
    guess_array_colorized = []
    guess_array.each do |guess|
      if guess == "r"
        guess_array_colorized << "R".red
      elsif guess == "g"
        guess_array_colorized << "G".green
      elsif guess == "b"
        guess_array_colorized << "B".blue
      elsif guess == "y"
        guess_array_colorized << "Y".yellow
      elsif guess == "o" && level != "beginner"
        guess_array_colorized << "O".light_red
      elsif guess == "p" && level == "advanced"
        guess_array_colorized << "P".magenta
      else
        guess_array_colorized << "X"
      end
    end
    guess_array_colorized.join("")
  end

end
