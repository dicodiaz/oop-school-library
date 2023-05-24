require_relative './nameable'

require 'date'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(id: DateTime.now.strftime('%s').to_i, name: nil, age: nil, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
