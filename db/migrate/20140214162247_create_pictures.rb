class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.text :picture_url
      t.references :jump
    end
  end
end
#t.timestamps - adds 2 columns, created at and updated at