# Addes an #of method to integers, taking either a single element, or a block
class Integer
  def of(ele=nil, &blk)
    r = []
    if ele
      self.times { r << ele }
    elsif block_given?
      self.times { r << blk.call }
    end
    r
  end
end
