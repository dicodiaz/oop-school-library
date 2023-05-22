require_relative '../app'

class ListRentalsExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'List rentals'
  end

  def execute
    App.new.list_rentals
  end
end
