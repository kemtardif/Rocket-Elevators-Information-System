class BuildingDetail < ApplicationRecord

    belongs_to :building

    has_settings do |s|
        s.key :information
    end
end
