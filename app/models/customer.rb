class Customer < ApplicationRecord
    belongs_to :address
    belongs_to :user
    has_many :building
end
