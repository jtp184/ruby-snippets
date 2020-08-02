# ActiveRecord.sample
# 
# Adds a method to efficiently sample instances
# of a model with an interface like Array#sample.
# Different databases use different random functions so YMMV
class ActiveRecord::Base
  def self.sample(n=1)
    r = self.order(db_random_function).limit(n)
    n == 1 ? r.first : r
  end
  
  def self.db_random_function
    return @db_random_function if @db_random_function
    
    app = Rails.instance_variable_get(:@application)
    db = app.config.database_configuration[Rails.env]['adapter']
    
    @db_random_function = case db
                          when 'mysql2'
                            'RAND()'
                          else
                            'random()'
                          end
  end
end
