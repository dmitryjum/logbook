class CreatePictureComments < ActiveRecord::Migration
  def change
    create_table :picture_comments do |t|
      t.text :comment
      t.references :jump
      t.references :user
      t.timestamps
    end
  end
end
