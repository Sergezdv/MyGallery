class Like < ActiveRecord::Base
   attr_accessible :user_id, :picture_id

  belongs_to :picture, :counter_cache => true
  belongs_to :user
end
