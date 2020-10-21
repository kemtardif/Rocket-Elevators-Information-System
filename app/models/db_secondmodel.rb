module Second
    
    class Base < ActiveRecord::Base
      self.abstract_class = true
      establish_connection DB_SECOND
    end

    class User < Second::Base
    end

end