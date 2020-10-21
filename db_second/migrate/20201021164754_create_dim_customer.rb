class CreateDimCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.string :customerCreationDate
      t.string :companyName
      t.string :companyMainContactFullName
      t.string :companyMainContactEmail
      t.integer :numberOfElevators
      t.string :customerCity
    end
  end
end
