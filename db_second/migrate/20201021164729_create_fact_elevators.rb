class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.string :elevatorSerialNumber
      t.string :elevatorComissioningDate
      t.integer :buildingId
      t.integer :customerId
      t.string :buildingCity
    end
  end
end
