class Battery < ApplicationRecord

    has_many :columns, dependent: :destroy

    belongs_to :building
    belongs_to :employee
end
