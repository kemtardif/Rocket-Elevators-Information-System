class AddBatteryToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :battery, foreign_key: true
    
  end
end
