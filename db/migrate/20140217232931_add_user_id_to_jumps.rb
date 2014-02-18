class AddUserIdToJumps < ActiveRecord::Migration
  def up
    add_column :jumps, :user_id, :integer
  end
end
