class MonthlyRecordResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :date, :date
  attribute :month, :integer
  attribute :monthly_net_carbon, :float
  attribute :offset_solution, :string
  attribute :offset_carbon_amount, :float

  # Direct associations

  belongs_to :user

  # Indirect associations
end
