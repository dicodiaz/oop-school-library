class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
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
