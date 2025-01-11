class NegativeNumberException < StandardError
  def initialize(negative_numbers)
    super("negative numbers not allowed #{negative_numbers.join(', ')}")
  end
end

class StringCalculator
  DEFAULT_DELIMITERS_REGEX = /[,|\n]/.freeze
  DELIMITERS_ENCLOSING_REGEX = /\[(.*?)\]/.freeze

  def add(numbers)
    return 0 if numbers.empty?

    delimiter, number_sequence = extract_delimiter(numbers)
    number_list = number_sequence.split(delimiter).map(&:to_i)

    negative_numbers = number_list.select(&:negative?)
    raise NegativeNumberException, negative_numbers unless negative_numbers.empty?

    number_list.reject { |number| number > 1000 }.sum
  end

  def extract_delimiter(numbers)
    return [DEFAULT_DELIMITERS_REGEX, numbers] unless numbers.start_with?("//")

    delimiter_string, number_sequence = numbers.split("\n", 2)
    custom_delimiter = delimiter_string.match?(DELIMITERS_ENCLOSING_REGEX) ? delimiter_string.scan(DELIMITERS_ENCLOSING_REGEX).flatten[0] : delimiter_string[2..]
    [custom_delimiter, number_sequence]
  end
end
