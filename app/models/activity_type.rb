class ActivityType < ApplicationRecord
  # Direct associations

  has_many   :activity_rankings,
             foreign_key: "activity_id",
             dependent: :destroy

  has_many   :activities_logs,
             foreign_key: "activity_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :activity_name, presence: true

  # Scopes

  def to_s
    activity_name
  end
end
