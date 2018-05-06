require 'minitest/autorun'
require 'minitest/pride'
require './lib/engine_class.rb'
require './lib/logic_class.rb'

class EngineTest < Minitest::Test

  def test_it_exists
    e = Engine.new
    assert_instance_of Engine, e
  end

  def test_play
    skip
    e = Engine.new
    assert_equal e.play, e.guess_prompt
  end

  def test_guess_prompt
    skip
    e = Engine.new
    assert_equal e.guess_prompt, e.guess_flow
  end

  def test_guess_flow
    skip
    e = Engine.new
    @guess = "rgby"
    @code = "ybgr"
    assert_equal e.guess_flow, e.guess_feedback
  end

  def test_guess_feedback
    skip
    e = Engine.new
    l = Logic.new
    @guess = "'r','g','b','y'"
    @code = "'y','b','g','r'"
    e.guess_feedback
    correct_colors = l.correct_color_counter(@guess, @code)
    correct_positions = l.correct_position_counter(@guess, @code)
    assert_equal 4, correct_colors
    assert_equal 0 , correct_positions
  end

  def test_congrats
    skip
    e = Engine.new
    assert_equal e.congrats, e.end_game
  end

  def test_end_game
    skip
    e = Engine.new
    assert_nil e
  end

  def test_end_game_flow
    skip
    e = Engine.new
    end_game_choice = 'invalid'
    output = e.end_game_flow(end_game_choice)
    assert_equal e.end_game, output
  end

  def test_print_history
    skip
    e = Engine.new
    output = e.print_history
    assert_equal e.guess_prompt, e
  end

  def test_attempt_counter
    skip
    e = Engine.new
    @attempts = 0
    e.attempt_counter
    assert_equal 1, @attempts
  end

end
