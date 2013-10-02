class Picture < ActiveRecord::Base
  #self.per_page = 5
  attr_accessible :image, :category_id

  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :comments
  has_many :users, :through => :like
  has_many :likes
end
