require 'minitest/autorun'
require 'minitest/pride'
require './lib/quit_class.rb'

class QuitTest < Minitest::Test

  def test_it_exists
    q = Quit.new
    assert_instance_of Quit,  q
  end

  def test_quitter
    skip
    q = Quit.new
    assert_nil q
  end

end
