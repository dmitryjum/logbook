class CreateJumps < ActiveRecord::Migration
  def change
    create_table :jumps do |t|
      t.integer :jump_number
      t.date :date
      t.string :location
      t.integer :freefall_time
      t.string :equipment
      t.string :aircraft
      t.integer :total_freefall_time
      t.text :notes
    end
  end
end
