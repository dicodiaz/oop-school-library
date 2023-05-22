require_relative '../app'
require_relative './executable'

class ListPeopleExecutor < Executable
  def help_text
    'List all people'
  end

  def execute
    App.new.list_people
  end
end
