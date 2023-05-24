require_relative './person'

require 'date'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id: DateTime.now.strftime('%s').to_i, name: nil, age: nil, specialization: nil)
    super(id: id, name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      type: self.class,
      id: @id,
      specialization: @specialization,
      age: @age,
      name: @name
    }.to_json
  end

  def self.from_json(data, _books, _people)
    new(id: data['id'], name: data['name'], age: data['age'], specialization: data['specialization'])
  end
end
