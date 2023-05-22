require_relative '../app'

class ExitExecutor
  attr_reader :help_text

  def initialize
    @help_text = 'Exit'
  end

  def execute
    App.new.exit
  end
end
