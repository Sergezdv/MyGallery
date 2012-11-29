# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#

class Picture < ActiveRecord::Base
  #self.per_page = 5
  attr_accessible :image, :category_id

  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :comments
  has_many :users, :through => :like
  has_many :likes
end
