class AddActivityReferenceToActivityRankings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_rankings, :activity_types, column: :activity_id
    add_index :activity_rankings, :activity_id
    change_column_null :activity_rankings, :activity_id, false
  end
end
