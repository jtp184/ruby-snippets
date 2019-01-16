# Allows for Dir.entries to be called without arguments and return Dir.entries(Dir.pwd)

class Dir
  class << self
    alias_method :_entries, :entries
  end
  def self.entries(*args)
    if args.empty?
     _entries(pwd)
    else
      _entries(*args)
    end
  end
end
