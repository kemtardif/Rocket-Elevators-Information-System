class Building < ApplicationRecord

    belongs_to :customer
    
    has_one :address
    has_one :building_detail, dependent: :destroy
    has_many :batteries, dependent: :destroy

 

end
