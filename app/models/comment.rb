# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  picture_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

class Comment < ActiveRecord::Base
  attr_accessible :title, :body, :picture_id

  belongs_to :picture
  belongs_to :user
end
