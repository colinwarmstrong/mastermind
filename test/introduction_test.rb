require 'minitest/autorun'
require 'minitest/pride'
require './lib/introduction_class.rb'

class IntroductionTest < Minitest::Test

  def test_it_exists
    i = Introduction.new
    assert_instance_of Introduction, i
  end

  def test_welcome
    skip
    i = Introduction.new
    message = i.welcome
    assert_nil message
  end

  def test_intro
    skip
    i = Introduction.new
    message = i.intro
    assert_nil message
  end

  def test_intro_flow
    skip
    i = Introduction.new
    intro_choice = 'i'
    flow = i.intro_flow(intro_choice)
    assert_equal flow, i.instructions
  end

  def instructions
    skip
    i = Introduction.new
    message = i.instructions
    assert_nil message
  end

end
