require_relative '../app'
require_relative './executable'

class CreateBookExecutor < Executable
  def help_text
    'Create a book'
  end

  def execute
    App.instance.create_book
  end
end
