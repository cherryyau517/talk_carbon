class LikeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :log_id, :integer
  attribute :liker_id, :integer

  # Direct associations

  belongs_to :liker,
             resource: UserResource

  # Indirect associations
end
