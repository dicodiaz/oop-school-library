require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def self.from_json(data)
    new(data['age'], data['name'], parent_permission: data['parent_permission'])
  end
end
