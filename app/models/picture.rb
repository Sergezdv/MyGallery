class Picture < ActiveRecord::Base
  attr_accessible :image, :category_id

  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :comments
  has_many :users
end
