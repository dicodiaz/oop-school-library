require_relative './app'
require_relative './executors/create_book_executor'
require_relative './executors/create_person_executor'
require_relative './executors/create_rental_executor'
require_relative './executors/exit_executor'
require_relative './executors/list_books_executor'
require_relative './executors/list_people_executor'
require_relative './executors/list_rentals_executor'

def main
  app = App.new

  options = [
    ListBooksExecutor.new,
    ListPeopleExecutor.new,
    CreatePersonExecutor.new,
    CreateBookExecutor.new,
    CreateRentalExecutor.new,
    ListRentalsExecutor.new,
    ExitExecutor.new
  ]

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
