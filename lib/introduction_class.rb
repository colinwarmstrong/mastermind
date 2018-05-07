require './lib/difficulty_class.rb'
require './lib/prompt_class.rb'
require './lib/quit_class.rb'

class Introduction

  def welcome
    print `clear`
    print "Welcome to #{'M'.red}#{'A'.green}#{'S'.blue}#{'T'.yellow}#{'E'.light_red}"
    puts "#{'R'.magenta}#{'M'.red}#{'I'.green}#{'N'.blue}#{'D'.yellow}"
    puts "\n"
    intro
  end

  def intro
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    pr = Prompt.new
    intro_choice = pr.prompter
    intro_flow(intro_choice)
  end

  def intro_flow(intro_choice)
    if intro_choice == 'i' || intro_choice == 'instructions'
      instructions
    elsif intro_choice == 'q' || intro_choice == 'quit'
      q = Quit.new
      q.quitter
    elsif intro_choice == 'p' || intro_choice == 'play'
      d = Difficulty.new
      d.difficulty_intro
    else
      puts "Invalid response. Try again."
      intro
    end
  end

  def instructions
    puts "INSTRUCTIONS:"
    puts "Mastermind is a code breaking game. You will attempt to guess the correct "
    puts "sequence of a randomly generated code. Each element in the code is "
    puts "represented by a color and a position. You must correctly guess the color "
    puts "and position of every element. After each guess, the game will tell you "
    puts "how many of the guessed elements are the correct color and how many of "
    puts "the guessed elements are in the correct position. Using this feedback, "
    puts "you can make better and better guesses until you arrive at the correct "
    puts "sequence. A black 'X' in a feedback sequence indicates an invalid input."
    puts "Good luck."
    puts "\n"
    intro
  end

end
