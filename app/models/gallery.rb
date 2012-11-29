# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

class Gallery < ActiveRecord::Base
  attr_accessible :name, :image

  mount_uploader :image, ImageUploader

  validates :name, presence: true

  after_initialize { puts "initialized" } # Gallery.new; Gallery.first
  after_save { puts "saved" } # Gallery.save; Gallery.create; Gallery.update_attributes()
  after_create { puts "create" }
  after_update { puts "updated" }
  after_destroy { puts "destroyed" } # Gallery.destroyed

end
