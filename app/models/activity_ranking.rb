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
            inclusion: { in: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
                              "12"] }

  validates :user_id, presence: true

  # Scopes

  def to_s
    user.to_s
  end
end
