# Addes an #of method to integers, taking either a single element, or a block
class Integer
  def of(ele=nil, &blk)
    if ele
      self * [ele]
    elsif block_given?
      self.times.with_object([]) { |_t, r| r << blk.call }
    end
  end
end
