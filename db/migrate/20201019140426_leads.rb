class Leads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads  do |t|
      t.string :ContactFullName
      t.string :CompanyName
      t.string :Email
      t.string :Phone
      t.string :ProjectName
      t.string :ProjectDescription
      t.string :Department
      t.string :Message
      t.binary :AttachedFile
      t.timestamps
    end
  end
end
