class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.text :code_url
      t.references :user
      t.references :jump
    end
  end
end
