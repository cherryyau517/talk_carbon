class Comment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :time, :presence => true

  # Scopes

  def to_s
    log.to_s
  end

end
