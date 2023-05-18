require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_books; end

  def list_people
    puts(@people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" })
  end

  def create_person
    option = input('number', 1..2, 'Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
    age = input('number', 1..1000, 'Age: ')
    name = input('string', /^[\w\s]+$/, 'Name: ')
    case option
    when 1
      parent_permission = input('string', /^[ynYN]$/, 'Has parent permission? [Y/N]: ')
      @people.push(Student.new(age, name, parent_permission: parent_permission))
    when 2
      specialization = input('string', /^[\w\s]+$/, 'Specialization: ')
      @people.push(Teacher.new(specialization, age, name))
    end
    puts 'Person created successfully'
  end

  def create_book; end

  def create_rental; end

  def list_rentals; end

  private

  def input(type, range_or_regex, print_text)
    print print_text
    case type
    when 'number'
      num = gets.chomp.to_i
      until num.between?(*range_or_regex.minmax)
        puts "Please input a number between #{range_or_regex.min} and #{range_or_regex.max}"
        print print_text
        num = gets.chomp.to_i
      end
      num
    when 'string'
      str = gets.chomp
      until str.match?(range_or_regex)
        puts "Please input a string that matches the regex: #{range_or_regex}"
        print print_text
        str = gets.chomp
      end
      str
    end
  end
end

app = App.new
app.create_person
app.create_person
app.list_people
