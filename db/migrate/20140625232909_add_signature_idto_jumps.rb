class AddSignatureIdtoJumps < ActiveRecord::Migration
  def up
    add_column :jumps, :signature_id, :integer
  end
end
