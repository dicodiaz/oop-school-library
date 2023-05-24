require_relative './nameable'
require_relative './decorators'

require 'json'
require 'date'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(id: nil, age: 0, name: 'Unknown', parent_permission: true)
    super()
    @id = id || DateTime.now.strftime('%s')
    @age = age
    @name = name
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
