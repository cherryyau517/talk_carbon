class ActivityType < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :activity_name, :presence => true

  # Scopes

  def to_s
    activity_name
  end

end
