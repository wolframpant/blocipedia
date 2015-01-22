class Image < ActiveRecord::Base
  
  mount_uploader :location, ImageUploader
  
  belongs_to :wiki
  belongs_to :user
  
end