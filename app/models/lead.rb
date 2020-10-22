class Lead < ApplicationRecord
    mount_uploader :picture, PictureUploader
end