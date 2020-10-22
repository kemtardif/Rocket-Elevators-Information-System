class CreateFactquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :factquotes do |t|
      t.string :contactid
      t.string :contactcreationdate
      t.string :contactcompanyname
      t.string :contactemail
      t.string :projectname
    end
  end
end
