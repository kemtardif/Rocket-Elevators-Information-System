class Customer < ApplicationRecord
    belongs_to :address, optional: true
    belongs_to :user, optional: true
    
    has_many :buildings, dependent: :destroy
end
