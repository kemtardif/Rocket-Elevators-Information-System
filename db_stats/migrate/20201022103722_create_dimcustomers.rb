class CreateDimcustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dimcustomers do |t|
      t.string :customercreationdate
      t.string :companyname
      t.string :companymaincontactfullName
      t.string :companymaincontactemail
      t.integer :numberOfelevators
      t.string :customercity
    end
  end
end
