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

  def to_json(*_args)
    {
      type: self.class,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }.to_json
  end

  def self.from_json(data, _books, _people)
    new(id: data['id'], name: data['name'], age: data['age'], parent_permission: data['parent_permission'])
  end

  private

  def of_age?
    @age >= 18
  end
end
