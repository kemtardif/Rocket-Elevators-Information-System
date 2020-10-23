class CreateFactelevator < ActiveRecord::Migration[5.2]
  def change
    create_table :factelevators do |t|
      t.string :elevatorserialnumber
      t.string :elevatorcomissioningdate
      t.integer :buildingid
      t.integer :customerid
      t.string :buildingcity
    end
  end
end
