require_relative './person'

require 'date'

class Student < Person
  attr_reader :classroom

  def initialize(id: DateTime.now.strftime('%s').to_i, name: nil, age: nil, parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
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
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }.to_json
  end

  def self.from_json(data)
    new(id: data['id'], name: data['name'], age: data['age'], parent_permission: data['parent_permission'])
  end
end
