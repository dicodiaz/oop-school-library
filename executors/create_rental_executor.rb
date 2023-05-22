require_relative '../app'
require_relative './executable'

class CreateRentalExecutor < Executable
  def help_text
    'Create a rental'
  end

  def execute
    App.new.create_rental
  end
end
