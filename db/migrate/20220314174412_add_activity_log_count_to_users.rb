class AddActivityLogCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activity_logs_count, :integer
  end
end
