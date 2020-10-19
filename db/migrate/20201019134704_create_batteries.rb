class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.integer :buildingId
      t.string :buildingType
      t.string :batteryStatus
      t.integer :employeeId
      t.string :commissioningDate
      t.string :lastInspectionDate
      t.string :operationCertificate
      t.string :batteryInformation
      t.string :batteryNotes
      t.timestamps
    end
  end
end
