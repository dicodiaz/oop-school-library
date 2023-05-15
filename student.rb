require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

p student1 = Student.new('2B', 7, 'Timmy', parent_permission: false)
p student1.play_hooky
p student1.can_use_services?
p student1.id
