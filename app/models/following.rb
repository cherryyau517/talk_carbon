class Following < ApplicationRecord
  # Direct associations

  belongs_to :follower,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :followed_id, :presence => true

  validates :follower_id, :presence => true

  # Scopes

  def to_s
    follower.to_s
  end

end
