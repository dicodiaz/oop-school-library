require_relative '../app'

class CreateRentalExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'Create a rental'
  end

  def execute
    App.new.create_rental
  end
end
