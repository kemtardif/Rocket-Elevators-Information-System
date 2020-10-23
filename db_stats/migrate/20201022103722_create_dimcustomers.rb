class CreateDimcustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dimcustomers do |t|
      t.string :customercreationdate
      t.string :companyname
      t.string :companymaincontactfullname
      t.string :companymaincontactemail
      t.integer :numberofelevators
      t.string :customercity
    end
  end
end
