require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  WORDS_NUMBERS_SPACES_REGEX = /^[\w\s]+$/.freeze

  private_class_method :new

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def self.instance
    @instance ||= new
  end

  def list_books
    puts(@books.map { |book| "Title: \"#{book.title}\", Author: #{book.author}" })
  end

  def list_people
    puts(@people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" })
  end

  def create_person
    option = input('number', 1..2, 'Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
    age = input('number', 1..1000, 'Age: ')
    name = input('string', WORDS_NUMBERS_SPACES_REGEX, 'Name: ')
    case option
    when 1
      parent_permission = input('string', /^[ynYN]$/, 'Has parent permission? [Y/N]: ')
      @people.push(Student.new(age, name, parent_permission: parent_permission.downcase == 'y'))
    when 2
      specialization = input('string', WORDS_NUMBERS_SPACES_REGEX, 'Specialization: ')
      @people.push(Teacher.new(specialization, age, name))
    end
    puts 'Person created successfully'
  end

  def create_book
    title = input('string', WORDS_NUMBERS_SPACES_REGEX, 'Title: ')
    author = input('string', WORDS_NUMBERS_SPACES_REGEX, 'Author: ')
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    print_text = "Select a book from the following list by number\n"
    print_text << @books.map.with_index do |book, index|
      "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end.join("\n").concat("\n")
    book_index = input('number', 0..(@books.length - 1), print_text)
    puts ''
    print_text = "Select a person from the following list by number (not id)\n"
    print_text << @people.map.with_index do |person, index|
      "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end.join("\n").concat("\n")
    person_index = input('number', 0..(@people.length - 1), print_text)
    puts ''
    date = input('string', %r{^\d{4}/\d{2}/\d{2}$}, 'Date(YYYY/MM/DD): ')
    @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))
    puts 'Rental created successfully'
  end

  def list_rentals
    person_id = input('number', 1..1000, 'ID of person: ')
    puts 'Rentals:'
    filtered_mapped_rentals = @rentals.filter_map do |rental|
      "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == person_id
    end
    puts filtered_mapped_rentals
  end

  def exit
    puts 'Thank you for using this app!'
  end

  def input(type, range_or_regex, print_text)
    print print_text
    case type
    when 'number'
      num = gets.chomp.to_i
      until num.between?(*range_or_regex.minmax)
        puts "\nPlease input a number between #{range_or_regex.min} and #{range_or_regex.max}"
        print print_text
        num = gets.chomp.to_i
      end
      num
    when 'string'
      str = gets.chomp
      until str.match?(range_or_regex)
        puts "\nPlease input a string that matches the regex: #{range_or_regex}"
        print print_text
        str = gets.chomp
      end
      str
    end
  end
end
