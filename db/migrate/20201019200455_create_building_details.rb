class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      
      t.belongs_to :building
      t.timestamps
    end
  end
end
