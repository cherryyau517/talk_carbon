class ActivitiesLog < ApplicationRecord
  # Direct associations

  belongs_to :activity,
             class_name: "ActivityType"

  has_many   :comments,
             foreign_key: "log_id",
             dependent: :destroy

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  has_many   :commenters,
             through: :comments,
             source: :commenter

  # Validations

  validates :activity_id, presence: true

  validates :activity_remarks, presence: true

  validates :addition, presence: true

  validates :carbon_amount, presence: true

  validates :date, presence: true

  validates :user_id, presence: true

  # Scopes

  def to_s
    activity.to_s
  end
end
