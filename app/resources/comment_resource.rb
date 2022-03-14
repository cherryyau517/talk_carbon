class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :log_id, :integer
  attribute :commenter_id, :integer
  attribute :comment, :string
  attribute :date, :date
  attribute :time, :string

  # Direct associations

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations

end
