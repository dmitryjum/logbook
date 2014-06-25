class AddSignatureIdToJumps < ActiveRecord::Migration
  def self.up
    change_table :jumps do |t|
      t.references :signature
    end
  end

  def self.down
    change_table :jumps do |t|
      t.references :signature
    end
  end
end


