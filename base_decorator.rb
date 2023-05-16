require './nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super(nameable.name)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end