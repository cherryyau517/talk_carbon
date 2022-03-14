class CreateMonthlyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_records do |t|
      t.integer :user_id
      t.date :date
      t.integer :month
      t.float :monthly_net_carbon
      t.string :offset_solution
      t.float :offset_carbon_amount

      t.timestamps
    end
  end
end
