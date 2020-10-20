class AddBatteryToBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :building_details, :battery, foreign_key: true
  end
end
