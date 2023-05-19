require_relative 'app'

def main
  app = App.new
  options = { 'Please choose an option by entering a number:' => '', 'List all books' => 'list_books',
              'List all people' => 'list_people', 'Create a person' => 'create_person',
              'Create a book' => 'create_book', 'Create a rental' => 'create_rental',
              'List all rentals for a given person id' => 'list_rentals', 'Exit' => 'exit' }
  puts 'Welcome to School Library App!'
  selected_option = -1
  until selected_option == options.length - 1
    print_text = options.keys.map.with_index do |option_key, index|
      "#{index.zero? ? '' : "#{index} - "}#{option_key}"
    end.join("\n").prepend("\n").concat("\n")
    selected_option = app.input('number', 1..(options.length - 1), print_text)
    app.public_send(options.values[selected_option - 1])
  end
end

main
