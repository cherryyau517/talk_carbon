class AddFollowerReferenceToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :followings, :users, column: :follower_id
    add_index :followings, :follower_id
    change_column_null :followings, :follower_id, false
  end
end
