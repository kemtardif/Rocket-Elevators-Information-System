class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :Address
      t.string :AdminName
      t.string :AdminEmail
      t.string :AdminPhone
      t.string :TechName
      t.string :TechEmail
      t.string :TechPhone

      t.timestamps
    end
  end
end
