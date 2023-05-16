require './nameable'
require './decorators'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person1 = Person.new(31, 'Dico')
person2 = Person.new(17, 'Peter', parent_permission: false)
p person1, person2
p person1.can_use_services?, person2.can_use_services?

person3 = Person.new(26, 'bartholomew')
p person3.correct_name
capitalized_person = CapitalizeDecorator.new(person3)
p capitalized_person.correct_name
trimmed_capitalized_person = TrimmerDecorator.new(capitalized_person)
p trimmed_capitalized_person.correct_name
p trimmed_capitalized_person.nameable
