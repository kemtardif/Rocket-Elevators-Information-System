class AddFunctionToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :function, :string
  end
end
