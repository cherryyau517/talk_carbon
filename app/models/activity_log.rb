class ActivityLog < ApplicationRecord
  # Direct associations

  belongs_to :activity_type

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    activity_name
  end
end
