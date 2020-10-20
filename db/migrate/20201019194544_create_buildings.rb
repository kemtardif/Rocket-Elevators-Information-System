class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :CustomerId
      t.string :Address
      t.string :AdminName
      t.string :AdminEmail
      t.integer :AdminPhone
      t.string :TechName
      t.string :TechEmail
      t.integer :TechPhone

      t.timestamps
    end
  end
end
