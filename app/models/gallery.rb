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
