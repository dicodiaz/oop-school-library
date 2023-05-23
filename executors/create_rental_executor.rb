require_relative '../app'
require_relative './executable'

class CreateRentalExecutor < Executable
  def help_text
    'Create a rental'
  end

  def execute
    App.instance.create_rental
  end
end
