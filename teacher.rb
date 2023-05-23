require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.from_json(data)
    new(data['specialization'], data['age'], data['name'])
  end
end
