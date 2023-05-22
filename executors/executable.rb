class Executable
  def help_text
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
