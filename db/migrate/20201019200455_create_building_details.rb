class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.integer :BuildingId

      t.timestamps
    end
  end
end
