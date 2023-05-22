require_relative '../app'
require_relative './executable'

class ListRentalsExecutor < Executable
  def help_text
    'List all rentals for a given person id'
  end

  def execute
    App.new.list_rentals
  end
end
