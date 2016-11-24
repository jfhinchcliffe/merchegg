class Item < ApplicationRecord
  mount_uploader :download_path, FileUploader
  belongs_to :box
  validates_presence_of :download_path, :name
  #Cloudinary::Utils.private_download_url self.cloudinary_id, self.format, attachment: true
  

end
