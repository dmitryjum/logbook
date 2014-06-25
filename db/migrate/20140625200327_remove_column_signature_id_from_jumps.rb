class RemoveColumnSignatureIdFromJumps < ActiveRecord::Migration
  def down
    remove_column :jumps, :signature_id
  end
end
