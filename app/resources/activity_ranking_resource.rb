class ActivityRankingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :activity_id, :integer
  attribute :date, :date
  attribute :carbon_amount, :float
  attribute :month, :integer

  # Direct associations

  belongs_to :activity,
             resource: ActivityTypeResource

  belongs_to :user

  # Indirect associations
end
