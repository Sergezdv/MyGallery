# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  picture_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base
   attr_accessible :user_id, :picture_id

  belongs_to :picture, :counter_cache => true
  belongs_to :user
end
