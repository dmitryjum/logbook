class ChangeColumnInPicComments < ActiveRecord::Migration
  def change
    rename_column :picture_comments, :jump_id, :picture_id
  end
end
