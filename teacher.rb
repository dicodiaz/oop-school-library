require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

p teacher1 = Teacher.new('Math', 32, 'Matilda')
p teacher1.can_use_services?
p teacher1.id
