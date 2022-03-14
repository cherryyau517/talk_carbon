class AddActivityTypeReferenceToActivityLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_logs, :activity_types
    add_index :activity_logs, :activity_type_id
    change_column_null :activity_logs, :activity_type_id, false
  end
end
