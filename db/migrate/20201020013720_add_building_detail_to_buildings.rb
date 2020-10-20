class AddBuildingDetailToBuildings < ActiveRecord::Migration[5.2]
  def change
  end
  add_reference :buildings, :building_detail, foreign_key: true
end
