require_relative '../app'

class CreatePersonExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'Create people'
  end

  def execute
    App.new.create_person
  end
end
