class Comment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :commenter_id, :presence => true

  validates :date, :presence => true

  validates :log_id, :presence => true

  validates :time, :presence => true

  # Scopes

  def to_s
    log.to_s
  end

end
