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

  def test_single_number_should_return_the_same_number
    result = @calculator.add("1")
    assert_equal 1, result
  end

  def test_single_number_along_with_comma_should_return_the_same_number
    result = @calculator.add("12,")
    assert_equal 12, result
  end
end
