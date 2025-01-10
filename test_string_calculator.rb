require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string_should_return_zero
    result = @calculator.add("")
    assert_equal 0, result
  end
end
