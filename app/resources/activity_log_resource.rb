class ActivityLogResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :activity_name, :string
  attribute :activity_type_id, :integer
  attribute :date, :date
  attribute :time, :string
  attribute :activity_remarks, :string
  attribute :addition, :boolean
  attribute :carbon_amount, :float
  attribute :user_id, :integer

  # Direct associations

  belongs_to :activity_type

  belongs_to :user

  # Indirect associations
end
