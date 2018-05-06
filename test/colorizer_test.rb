require 'minitest/autorun'
require 'minitest/pride'
require 'colorize'
require './lib/colorizer_class.rb'

class ColorizerTest < Minitest::Test

  def test_it_exists
    c = Colorizer.new
    assert_instance_of Colorizer, c
  end

  def test_colorize_flow
    c = Colorizer.new
    example = c.colorize_flow("rgbyop", "advanced")
    assert_equal "#{'R'.red}#{'G'.green}#{'B'.blue}#{'Y'.yellow}#{'O'.light_red}#{'P'.magenta}", example
  end

end
