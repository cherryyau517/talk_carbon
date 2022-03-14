class CreateActivityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_types do |t|
      t.string :activity_name

      t.timestamps
    end
  end
end
