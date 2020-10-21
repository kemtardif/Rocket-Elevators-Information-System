class CreateFactContact < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.string :contactid
      t.string :contactCreationDate
      t.string :contactCompanyName
      t.string :contactEmail
      t.string :projectName

    end
  end
end
