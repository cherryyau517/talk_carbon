class AddCommentCountToActivitiesLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :activities_logs, :comments_count, :integer
  end
end
