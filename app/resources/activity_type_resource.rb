class ActivityTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :activity_name, :string

  # Direct associations

  has_many   :activities_logs,
             foreign_key: :activity_id

  # Indirect associations

end
