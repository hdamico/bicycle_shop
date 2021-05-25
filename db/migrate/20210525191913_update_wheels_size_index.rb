class UpdateWheelsSizeIndex < ActiveRecord::Migration[6.1]
  def up
    remove_index :wheels, :size, unique: true
    add_index :wheels, :size
  end

  def down
    remove_index :wheels, :size
    add_index :wheels, :size, unique: true
  end
end
