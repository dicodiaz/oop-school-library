require_relative './app'

class CreateRentalExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'Create a rental'
  end

  def execute
    App.new.create_rental
  end
end

class ListRentalsExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'List all rentals for a given person id'
  end

  def execute
    App.new.list_rentals
  end
end

def main
  app = App.new
  # options = { 'Please choose an option by entering a number:' => '', 'List all books' => 'list_books',
  #             'List all people' => 'list_people', 'Create a person' => 'create_person',
  #             'Create a book' => 'create_book', 'Create a rental' => 'create_rental',
  #             'List all rentals for a given person id' => 'list_rentals', 'Exit' => 'exit' }

  options = [CreateRentalExecuter.new, ListRentalsExecuter.new]

  puts 'Welcome to School Library App!'
  selected_option = -1
  until selected_option == options.length
    print_text = options.map.with_index do |option, index|
      "#{"#{index + 1} - "}#{option.help_text}"
    end.join("\n").prepend("Please choose an option by entering a number:\n").concat("\n")
    selected_option = app.input('number', 1..options.length, print_text) - 1
    options[selected_option].execute
  end
end

main
