class AddColumnToBatteries < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :column, index: true
    add_foreign_key :batteries, :columns
  end
end
