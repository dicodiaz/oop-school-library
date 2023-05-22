require_relative '../app'
require_relative './executable'

class ListBooksExecutor < Executable
  def help_text
    'List all books'
  end

  def execute
    App.new.list_books
  end
end
