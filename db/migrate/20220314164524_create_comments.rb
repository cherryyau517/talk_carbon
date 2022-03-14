class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :log_id
      t.integer :commenter_id
      t.text :comment
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
