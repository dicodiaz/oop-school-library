require './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.name.capitalize!
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.name.slice!(0, 10)
  end
end
