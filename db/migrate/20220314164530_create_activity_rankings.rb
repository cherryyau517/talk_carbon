class CreateActivityRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_rankings do |t|
      t.integer :user_id
      t.integer :activity_id
      t.date :date
      t.integer :month
      t.float :carbon_amount

      t.timestamps
    end
  end
end
