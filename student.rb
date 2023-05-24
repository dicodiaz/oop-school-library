require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, name, parent_permission)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      type: self.class,
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission
    }.to_json
  end

  def self.from_json(data)
    new(data['id'], data['age'], data['name'], data['parent_permission'])
  end
end
