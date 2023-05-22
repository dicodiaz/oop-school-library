require_relative '../app'

class ListBooksExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'List books'
  end

  def execute
    App.new.list_books
  end
end
