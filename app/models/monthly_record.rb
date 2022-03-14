class MonthlyRecord < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :date, presence: true

  validates :month, presence: true

  validates :month,
            numericality: { less_than_or_equal_to: 12,
                            greater_than_or_equal_to: 1 }

  validates :monthly_net_carbon, presence: true

  validates :user_id, presence: true

  # Scopes

  def to_s
    user.to_s
  end
end
