class AddAttachmentImageFileToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :image_file
    end
  end

  def self.down
    drop_attached_file :pictures, :image_file
  end
end
