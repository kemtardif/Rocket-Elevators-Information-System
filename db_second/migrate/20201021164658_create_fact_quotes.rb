class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :quoteId
      t.string :quoteCreationDate
      t.string :companyName
      t.string :email
      t.integer :numberOfElevators
    end
  end
end
