require_relative './nameable'
require_relative './decorators'

require 'json'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
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

  def jsonify
    JSON.dump({
                age: @age,
                name: @name,
                parent_permission: @parent_permission,
                type: self.class
              })
  end

  private

  def of_age?
    @age >= 18
  end
end
