class ChangeAttachmentType < ActiveRecord::Migration[5.2]
  def change
    change_column :leads, :binary, :blob

  end
end
