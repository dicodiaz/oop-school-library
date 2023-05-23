require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, specialization, age, name)
    super(id: id, age: age, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.from_json(data)
    new(data['id'], data['specialization'], data['age'], data['name'])
  end
end
