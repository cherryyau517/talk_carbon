class CreateMonthlyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_records do |t|
      t.integer :user_id
      t.date :date
      t.float :monthly_net_carbon
      t.string :offset_solution
      t.float :offset_carbon_amount
      t.integer :month

      t.timestamps
    end
  end
end
