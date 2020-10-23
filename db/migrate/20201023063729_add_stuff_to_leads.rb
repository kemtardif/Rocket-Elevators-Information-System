class AddStuffToLeads < ActiveRecord::Migration[5.2]
  def change

    rename_column :leads, :contactFullName, :ContactFullName
    rename_column :leads, :companyName, :CompanyName
    rename_column :leads, :email, :Email
    rename_column :leads, :phone, :Phone
    rename_column :leads, :projectName, :ProjectName
    rename_column :leads, :projectDescription, :ProjectDescription
    rename_column :leads, :department, :Department
    rename_column :leads, :message, :Message
    rename_column :leads, :attachedFile, :AttachedFile
  end
end
