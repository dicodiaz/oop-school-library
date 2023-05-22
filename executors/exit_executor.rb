require_relative '../app'
require_relative './executable'

class ExitExecutor < Executable
  def help_text
    'Exit'
  end

  def execute
    App.new.exit
  end
end
