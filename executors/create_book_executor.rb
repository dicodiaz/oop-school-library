require_relative '../app'

class CreateBookExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'Create book'
  end

  def execute
    App.new.create_book
  end
end
