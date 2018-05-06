require "minitest/autorun"
require "minitest/pride"
require "./lib/difficulty_class.rb"
require "./lib/engine_class.rb"

class DifficultyTest < Minitest::Test

  def test_it_exists
    d = Difficulty.new
    assert_instance_of Difficulty, d
  end

  def test_difficulty_flow
    skip
    d = Difficulty.new
    input = d.difficulty_flow("X")
    assert_equal input, "Invalid respone. Try again."
  end

  def test_beginner
    skip
    d = Difficulty.new
    e = Engine.new
    input = d.beginner
    assert_equal e.level, "beginner"
  end

  def test_intermediate
    skip
    d = Difficulty.new
    e = Engine.new
    input = d.intermediate
    assert_equal e.level, "intermediate"
  end

  def test_advanced
    skip
    d = Difficulty.new
    e = Engine.new
    input = d.advanced
    assert_equal e.level, "advanced"
  end

end
