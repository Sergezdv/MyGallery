class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  has_many :comments
  has_many :likes

  has_many :events, :as => :eventtable

  validates :email, :presence => true, :uniqueness => true

  after_create :create_use

  def create_use
    self.events.create(:eventtable_body => "created_at", :user_id => self.id)
  end
end
