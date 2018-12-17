require './lib/colorizer.rb'
require './lib/logic.rb'
require './lib/prompt.rb'
require './lib/quit.rb'
require 'colorize'
require 'csv'

class Engine
  attr_writer :level,
              :level_color,
              :code_length,
              :number_of_colors,
              :color_array,
              :color_string_long

  def initialize
    @attempts = 0
    @history  = []
  end

  def play
    l = Logic.new
    @code = l.code_generator(@code_length, @color_array)
    puts "I have generated a random #{@level} sequence with #{@code_length} elements made up of "
    puts "#{@number_of_colors} colors: #{@color_string_long}."
    puts 'At any time, use (h)istory to view your previous guesses and results,'
    puts '(c)heat to view the sequence, and (q)uit to quit the game.'
    puts "\n"
    @start = Time.new
    guess_prompt
  end

  def guess_prompt
    puts "What's your guess?"
    pr = Prompt.new
    @guess = pr.prompter
    guess_flow
  end

  def guess_flow
    if @guess == 'h' || @guess == 'history'
      print_history
    elsif @guess == 'c' || @guess == 'cheat'
      c = Colorizer.new
      puts "The secret code is '#{c.colorize_flow(@code, @level)}'"
      guess_prompt
    elsif @guess == 'q' || @guess == 'quit'
      q = Quit.new
      q.quitter
    elsif @guess.length < @code.length
      puts "Your guess is too short, the sequence consists of #{@code.length} elements."
      guess_prompt
    elsif @guess.length > @code.length
      puts "Your guess is too long, the sequence consists of #{@code.length} elements."
      guess_prompt
    elsif @guess == @code
      attempts_counter
      congrats
    else
      guess_feedback
    end
  end

  def guess_feedback
    attempts_counter
    l = Logic.new
    correct_colors = l.correct_color_counter(@guess, @code)
    correct_positions = l.correct_position_counter(@guess, @code)
    c = Colorizer.new
    guess_colored = c.colorize_flow(@guess, @level)
    puts "'#{guess_colored}' has #{correct_colors} of the correct elements with #{correct_positions} in the correct position."
    puts "You've taken #{@attempts} guesses."
    @history << "'#{guess_colored}': #{correct_colors} correct elements, #{correct_positions} correct positions"
    guess_prompt
  end

  def congrats
    finish = Time.new
    @completion_time = (finish - @start).to_i
    c = Colorizer.new
    print "#{'C'.red}#{'O'.green}#{'N'.blue}#{'G'.yellow}#{'R'.light_red}#{'A'.magenta}#{'T'.red}#{'U'.green}"
    print "#{'L'.blue}#{'A'.yellow}#{'T'.light_red}#{'I'.magenta}#{'O'.red}#{'N'.green}#{'S'.blue}#{'!'.yellow} "
    puts "You solved the #{@level_color} sequence '#{c.colorize_flow(@code, @level)}'"
    puts "in #{@attempts} guesses over #{@completion_time / 60} minutes, #{@completion_time % 60} seconds."
    leaderboard_writer
    end_game
  end

  def end_game
    puts "\nDo you want to (p)lay again, (q)uit?, or view the (l)eaderboard?"
    pr = Prompt.new
    end_game_choice = pr.prompter
    end_game_flow(end_game_choice)
  end

  def end_game_flow(end_game_choice)
    if end_game_choice == 'p' || end_game_choice == 'play'
      print `clear`
      d = Difficulty.new
      d.difficulty_intro
    elsif end_game_choice == 'q' || end_game_choice == 'quit'
      q = Quit.new
      q.quitter
    elsif end_game_choice == 'l' || end_game_choice == 'leaderboard'
      leaderboard_reader
      end_game
    else
      puts 'Invalid response. Try again.'
      end_game
    end
  end

  def print_history
    puts 'Here are your previous guesses and results:'
    @history.each do |guess|
      puts guess
    end
    puts "\n"
    guess_prompt
  end

  def attempts_counter
    @attempts += 1
  end

  def leaderboard_writer
    puts "\n"
    puts 'Please enter your name for the leaderboard:'
    pr = Prompt.new
    name = pr.prompter
    c = Colorizer.new
    CSV.open('./lib/leaderboard.csv', 'ab') do |leaderboard|
      if @attempts < 100 && @completion_time / 60 < 100
      leaderboard << ["#{name.capitalize} solved", "'#{c.colorize_flow(@code, @level)}' in", @attempts.to_s.rjust(2, "0"),
                      "attempts over", "#{(@completion_time/60).to_s.rjust(2, "0")}m","#{(@completion_time % 60).to_s.rjust(2, "0")}s."]
      end
    end
  end

  def leaderboard_reader
    puts "\n"
    puts '=== TOP 10 ==='
    leaders = CSV.read('./lib/leaderboard.csv')
    leaders_sorted = leaders.sort_by { |leader| leader[2] }
    leaders_sorted.each_with_index do |leader, index|
      if index < 10
        leader_string = leader.join(' ')
        puts "#{index + 1}. #{leader_string}"
      end
    end
  end
end
