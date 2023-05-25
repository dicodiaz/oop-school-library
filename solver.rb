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
end
