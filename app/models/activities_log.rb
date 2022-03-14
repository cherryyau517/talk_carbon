class ActivitiesLog < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :activity_remarks, :presence => true

  validates :addition, :presence => true

  validates :carbon_amount, :presence => true

  validates :date, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    activity.to_s
  end

end
