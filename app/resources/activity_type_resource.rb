class ActivityTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :activity_name, :string

  # Direct associations

  has_many   :activity_logs

  has_many   :activity_rankings,
             foreign_key: :activity_id

  # Indirect associations
end
