class AddActivitiesLogCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activities_logs_count, :integer
  end
end
