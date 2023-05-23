require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'

require 'date'

puts '', 'Student', ''

p student1 = Student.new(7, 'Timmy', parent_permission: false)
p student1.play_hooky
p student1.can_use_services?
p student1.id

puts '', 'Teacher', ''

p teacher1 = Teacher.new('Math', 32, 'Matilda')
p teacher1.can_use_services?
p teacher1.id

puts '', 'Person', ''

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

puts '', 'Classroom', ''

classroom1 = Classroom.new('2A')
classroom2 = Classroom.new('2B')

student2 = Student.new(7, 'Jimmy', parent_permission: false)

p classroom1.add_student(student1).add_student(student2)
student2.classroom = classroom2
p student2, classroom1, classroom2

puts '', 'Rental', ''

book1 = Book.new('After Many a Summer Dies the Swan', 'Aldous Huxley')
book2 = Book.new('Ah, Wilderness!', 'Eugene O\'Neill')

Rental.new(Date.new(2023, 5, 17), book1, person1)
Rental.new(Date.new(2023, 4, 16), book2, person1)
Rental.new(Date.new(2023, 3, 15), book2, person2)
p book1.rentals.length, (book1.rentals.map { |rental| rental.person.name })
p book2.rentals.length, (book2.rentals.map { |rental| rental.person.name })
p person1.rentals.length, (person1.rentals.map { |rental| rental.book.title })
p person2.rentals.length, (person2.rentals.map { |rental| rental.book.title })
