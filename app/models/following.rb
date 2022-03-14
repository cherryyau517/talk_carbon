class Following < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :follower_id, :presence => true

  # Scopes

  def to_s
    follower.to_s
  end

end
