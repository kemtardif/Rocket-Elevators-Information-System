class Building < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :address, optional: true

 

end
