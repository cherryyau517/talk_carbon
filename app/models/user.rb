class User < ApplicationRecord
  # Direct associations

  has_many   :activity_rankings,
             :dependent => :destroy

  has_many   :activities_logs,
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :likes,
             :foreign_key => "liker_id",
             :dependent => :destroy

  has_many   :followings,
             :foreign_key => "follower_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :user_name, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
