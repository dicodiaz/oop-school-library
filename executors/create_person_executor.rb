require_relative '../app'
require_relative './executable'

class CreatePersonExecutor < Executable
  def help_text
    'Create a person'
  end

  def execute
    App.new.create_person
  end
end
