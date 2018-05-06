require 'minitest/autorun'
require 'minitest/pride'
require './lib/logic_class.rb'

class LogicTest < Minitest::Test

  def test_it_exists
    l = Logic.new
    assert_instance_of Logic, l
  end

  def test_code_generator
    # skip
    l = Logic.new
    code_string = l.code_generator(4, ['r', 'g', 'b', 'y'])
    assert_equal 4, code_string.length
    code_string = l.code_generator(6, ['r', 'g', 'b', 'y', '0'])
    assert_equal 6, code_string.length
    code_string = l.code_generator(8, ['r', 'g', 'b', 'y', 'o', 'p'])
    assert_equal 8, code_string.length
  end

  def test_correct_color_counter
    # skip
    l = Logic.new
    correct_color_count = l.correct_color_counter("rgby", "ybgr")
    assert_equal 4, correct_color_count
    correct_color_count = l.correct_color_counter("rrrr", "rrgb")
    assert_equal 2, correct_color_count
    correct_color_count = l.correct_color_counter("rgbb", "gggy")
    assert_equal 1, correct_color_count
  end

  def test_correct_position_counter
    # skip
    l = Logic.new
    correct_position_counter = l.correct_position_counter("rrby", "brby")
    assert_equal 3, correct_position_counter
    correct_position_counter = l.correct_position_counter("rgby", "rybg")
    assert_equal 2, correct_position_counter
    correct_position_counter = l.correct_position_counter("rrrb", "rybr")
    assert_equal 1, correct_position_counter
  end

end
