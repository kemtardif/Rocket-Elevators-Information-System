class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :batteryId
      t.integer :numberOfServedFloors
      t.string :columnStatus
      t.string :columnInformation
      t.string :columnNotes

      t.timestamps
    end
  end
end