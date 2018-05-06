require 'minitest/autorun'
require 'minitest/pride'
require './lib/prompt_class.rb'

class PromptTest < Minitest::Test

  def test_it_exists
    pr = Prompt.new
    assert_instance_of Prompt, pr
  end

  def test_prompter
    skip
    pr = Prompt.new
    input = pr.prompter
    assert_instance_of String, input
  end

end
