module Kernel
  def require!(path)
    require path
  rescue LoadError
    Gem.install(path)
    require path
  end
end
