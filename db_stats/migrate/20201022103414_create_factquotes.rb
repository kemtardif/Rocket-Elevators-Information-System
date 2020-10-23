class CreateFactquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :factquotes do |t|
        t.string :quoteid
        t.string :quotecreationdate
        t.string :quotecompanyname
        t.string :quoteemail
        t.string :quotenbelevator
    end
  end
end
