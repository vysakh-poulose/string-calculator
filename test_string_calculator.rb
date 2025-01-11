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

  def test_single_number_along_with_multiple_commas_should_return_the_same_number
    result = @calculator.add("12,,,,")
    assert_equal 12, result
  end

  def test_two_numbers_should_return_their_sum
    result =  @calculator.add("12,1")
    assert_equal 13, result
  end

  def test_multiple_numbers_should_return_their_sum
    result =  @calculator.add("1,2,3,4")
    assert_equal 10, result
  end

  def test_multiple_numbers_with_random_commas_should_return_their_sum
    result =  @calculator.add("1,,2,,,4")
    assert_equal 7, result
  end
end
