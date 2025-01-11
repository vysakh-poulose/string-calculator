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

  def test_multiple_numbers_should_return_their_sum_with_newline_as_a_delimiter
    result = @calculator.add("1\n2\n3,4")
    assert_equal 10, result
  end

  def test_custom_delimiters_should_be_supported
    result = @calculator.add("//;\n1;2;3")
    assert_equal 6, result
  end

  def test_negative_numbers_should_not_be_valid
    error = assert_raise NegativeNumberException do
      @calculator.add("1,-2,-3")
    end
    assert_equal "negative numbers not allowed -2, -3", error.message
  end
end
