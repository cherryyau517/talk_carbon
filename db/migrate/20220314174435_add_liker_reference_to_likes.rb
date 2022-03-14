class AddLikerReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :users, column: :liker_id
    add_index :likes, :liker_id
    change_column_null :likes, :liker_id, false
  end
end
