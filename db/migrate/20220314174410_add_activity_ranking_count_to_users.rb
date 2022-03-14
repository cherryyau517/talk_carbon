class AddActivityRankingCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activity_rankings_count, :integer
  end
end
