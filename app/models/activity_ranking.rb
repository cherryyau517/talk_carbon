class ActivityRanking < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :month, :inclusion => { :in => [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ]  }

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
