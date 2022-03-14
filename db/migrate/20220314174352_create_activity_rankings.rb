class CreateActivityRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_rankings do |t|
      t.integer :user_id
      t.integer :activity_id
      t.date :date
      t.float :carbon_amount
      t.integer :month

      t.timestamps
    end
  end
end
