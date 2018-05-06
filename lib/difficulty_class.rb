require './lib/engine_class.rb'
require './lib/prompt_class.rb'
require './lib/quit_class.rb'

class Difficulty

  def difficulty_intro
    puts "Select your difficulty level: #{'(b)eginner'.green}, #{'(i)ntermediate'.yellow}, or #{'(a)dvanced'.red}"
    pr = Prompt.new
    level_choice = pr.prompter
    difficulty_flow(level_choice)
  end

  def difficulty_flow(level_choice)
    if level_choice == "b" || level_choice == "beginner"
      beginner
    elsif level_choice == "i" || level_choice == "intermediate"
      intermediate
    elsif level_choice == "a" || level_choice == "advanced"
      advanced
    elsif level_choice == "q" || level_choice == "quit"
      q = Quit.new
      q.quitter
    else
      puts "Invalid response. Try again."
      difficulty_intro
    end
  end

  def beginner
    e = Engine.new
    e.level = "beginner"
    e.level_color = 'beginner'.green
    e.code_length = 4
    e.number_of_colors = 4
    e.color_array = ["r", "g", "b", "y"]
    e.color_string_long = "#{'(r)ed'.red}, #{'(g)reen'.green}, #{'(b)lue'.blue}, and #{'(y)ellow'.yellow}"
    e.play
  end

  def intermediate
    e = Engine.new
    e.level = "intermediate"
    e.level_color = 'intermediate'.yellow
    e.code_length = 6
    e.number_of_colors = 5
    e.color_array = ["r", "g", "b", "y", "o"]
    e.color_string_long = "#{'(r)ed'.red}, #{'(g)reen'.green}, #{'(b)lue'.blue}, #{'(y)ellow'.yellow}, and #{'(o)range'.light_red}"
    e.play
  end

  def advanced
    e = Engine.new
    e.level = "advanced"
    e.level_color = 'advanced'.red
    e.code_length = 8
    e.number_of_colors = 6
    e.color_array = ["r", "g", "b", "y", "o", "p"]
    e.color_string_long = "#{'(r)ed'.red}, #{'(g)reen'.green}, #{'(b)lue'.blue}, #{'(y)ellow'.yellow}, #{'(o)range'.light_red}, and #{'(p)urple'.magenta}"
    e.play
  end

end
