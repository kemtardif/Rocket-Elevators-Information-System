class ChangeAttachmentType < ActiveRecord::Migration[5.2]
  def change
    change_column :leads, :attachedFile, :blob

  end
end
