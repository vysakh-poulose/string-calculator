class StringCalculator
  DEFAULT_DELIMITERS_REGEX = /[,|\n]/.freeze

  def add(numbers)
    return 0 if numbers.empty?

    delimiter, number_sequence = extract_delimiters(numbers)
    number_sequence.split(delimiter).map(&:to_i).sum
  end

  def extract_delimiters(numbers)
    return [DEFAULT_DELIMITERS_REGEX, numbers] unless numbers.start_with?("//")

    delimiter_string, number_sequence = numbers.split("\n", 2)
    custom_delimiter = delimiter_string[2..]
    [custom_delimiter, number_sequence]
  end
end
