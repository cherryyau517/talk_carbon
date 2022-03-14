class AddUserReferenceToActivitiesLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities_logs, :users
    add_index :activities_logs, :user_id
    change_column_null :activities_logs, :user_id, false
  end
end
