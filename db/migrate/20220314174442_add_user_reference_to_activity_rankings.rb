class AddUserReferenceToActivityRankings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_rankings, :users
    add_index :activity_rankings, :user_id
    change_column_null :activity_rankings, :user_id, false
  end
end
