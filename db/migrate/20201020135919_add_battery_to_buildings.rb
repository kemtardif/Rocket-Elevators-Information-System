class AddBatteryToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :battery, index: true
    add_foreign_key :buildings, :batteries
  end
end
