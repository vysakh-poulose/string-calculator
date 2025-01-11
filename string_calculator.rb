class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",","\n"]
    numbers.split(Regexp.union(delimiters)).map(&:to_i).sum
  end
end
