class AddExitAltToJumps < ActiveRecord::Migration
  def up
    add_column :jumps, :exit_altitude, :integer
  end
end
