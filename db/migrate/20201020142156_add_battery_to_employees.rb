class AddBatteryToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :battery, index: true
    add_foreign_key :employees, :batteries
  end
end
