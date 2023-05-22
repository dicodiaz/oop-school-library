require_relative '../app'

class ListPeopleExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'List people'
  end

  def execute
    App.new.list_people
  end
end
