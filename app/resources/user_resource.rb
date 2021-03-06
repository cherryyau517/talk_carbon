class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string

  # Direct associations

  has_many   :monthly_records

  has_many   :activity_rankings

  has_many   :activities_logs

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :likes,
             foreign_key: :liker_id

  has_many   :followings,
             foreign_key: :follower_id

  # Indirect associations

  many_to_many :logs,
               resource: ActivitiesLogResource
end
