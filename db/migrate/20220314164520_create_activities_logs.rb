class CreateActivitiesLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activities_logs do |t|
      t.integer :activity_id
      t.date :date
      t.time :time
      t.text :activity_remarks
      t.boolean :addition
      t.float :carbon_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
