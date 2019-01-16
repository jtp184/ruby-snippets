# ActiveRecord.sample
# 
# Adds a method to efficiently sample instances
# of a model with an interface like Array#sample.
# Different databases use different random functions so YMMV
class ActiveRecord::Base
  def self.sample(n=1)
    r = self.order('random()').limit(n)
    r.one? ? r.first : r
  end
end
