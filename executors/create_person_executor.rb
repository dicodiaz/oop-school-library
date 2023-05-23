require_relative '../app'
require_relative './executable'

class CreatePersonExecutor < Executable
  def help_text
    'Create a person'
  end

  def execute
    App.instance.create_person
  end
end
