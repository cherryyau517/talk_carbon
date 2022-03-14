class AddLogReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :activities_logs, column: :log_id
    add_index :comments, :log_id
    change_column_null :comments, :log_id, false
  end
end
