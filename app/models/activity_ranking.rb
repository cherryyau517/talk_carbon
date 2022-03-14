class ActivityRanking < ApplicationRecord
  # Direct associations

  belongs_to :activity,
             class_name: "ActivityType"

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  validates :activity_id, presence: true

  validates :carbon_amount, presence: true

  validates :date, presence: true

  validates :month, presence: true

  validates :month,
            numericality: { less_than_or_equal_to: 12,
                            greater_than_or_equal_to: 1 }

  validates :user_id, presence: true

  # Scopes

  def to_s
    user.to_s
  end
end
