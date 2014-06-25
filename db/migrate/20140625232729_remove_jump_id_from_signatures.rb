class RemoveJumpIdFromSignatures < ActiveRecord::Migration
  def change
    remove_column :signatures, :jump_id
  end
end
