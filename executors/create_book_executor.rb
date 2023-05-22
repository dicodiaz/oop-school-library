require_relative '../app'
require_relative './executable'

class CreateBookExecutor
  def help_text
    'Create a book'
  end

  def execute
    App.new.create_book
  end
end
