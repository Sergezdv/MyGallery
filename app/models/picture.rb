class Picture < ActiveRecord::Base
  attr_accessible :image, :category_id

  mount_uploader :image, ImageUploader
end
