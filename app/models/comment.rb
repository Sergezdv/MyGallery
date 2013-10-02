class Comment < ActiveRecord::Base
  attr_accessible :title, :body, :picture_id

  belongs_to :picture
  belongs_to :user
end
