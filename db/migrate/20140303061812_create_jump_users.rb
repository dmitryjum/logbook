class CreateJumpUsers < ActiveRecord::Migration
  def change
    create_table :jump_users do |t|
      t.references :user
      t.references :jump
    end
  end
end
