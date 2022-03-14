class Comment < ApplicationRecord
  # Direct associations

  belongs_to :commenter,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  validates :comment, presence: true

  validates :commenter_id, presence: true

  validates :date, presence: true

  validates :log_id, presence: true

  validates :time, presence: true

  # Scopes

  def to_s
    log_id
  end
end
