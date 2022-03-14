class ActivitiesLogResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :activity_id, :integer
  attribute :date, :date
  attribute :time, :string
  attribute :activity_remarks, :string
  attribute :addition, :boolean
  attribute :carbon_amount, :float
  attribute :user_id, :integer

  # Direct associations

  belongs_to :activity,
             resource: ActivityTypeResource

  has_many   :comments,
             foreign_key: :log_id

  belongs_to :user

  # Indirect associations

  many_to_many :commenters,
               resource: UserResource

end
