class AddActivityReferenceToActivitiesLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities_logs, :activity_types, column: :activity_id
    add_index :activities_logs, :activity_id
    change_column_null :activities_logs, :activity_id, false
  end
end
