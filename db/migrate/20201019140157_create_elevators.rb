class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :columnId
      t.string :elevatorSerialNumber
      t.string :elevatorModel
      t.string :elevatorType
      t.string :elevatorStatus
      t.string :elevatorDateOfComissioning
      t.string :elevatorDateOfLastInspection
      t.string :elevatorDateOfLastInspection
      t.string :elevatorCertificateOfInspection
      t.string :elevatorInformation
      t.string :elevatorNotes

      t.timestamps
    end
  end
end
