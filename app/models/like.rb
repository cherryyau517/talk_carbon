class Like < ApplicationRecord
  # Direct associations

  belongs_to :liker,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  validates :liker_id, presence: true

  validates :log_id, presence: true

  # Scopes

  def to_s
    log_id
  end
end
