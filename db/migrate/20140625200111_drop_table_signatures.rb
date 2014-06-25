class DropTableSignatures < ActiveRecord::Migration
  def down
    drop_table :signatures
  end
end
