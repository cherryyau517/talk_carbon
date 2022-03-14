class AddUserReferenceToMonthlyRecords < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :monthly_records, :users
    add_index :monthly_records, :user_id
    change_column_null :monthly_records, :user_id, false
  end
end
