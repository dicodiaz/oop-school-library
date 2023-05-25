class Solver
  def factorial(num)
    raise(ArgumentError, 'Invalid argument') unless num.is_a?(Integer)
    raise(ArgumentError, 'Negative number') if num.negative?
    return 1 if num.zero?

    num * factorial(num - 1)
  end

  def reverse(str)
    raise(ArgumentError, 'Invalid argument') unless str.is_a?(String)

    str.reverse
  end

  def fizzbuzz(num)
    return 'fizzbuzz' if (num % 3).zero? && (num % 5).zero?
    return 'fizz' if (num % 3).zero?
    return 'buzz' if (num % 5).zero?

    num.to_s
  end
end
