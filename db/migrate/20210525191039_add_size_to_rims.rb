class AddSizeToRims < ActiveRecord::Migration[6.1]
  def up
    add_column :rims, :size, :integer
  end

  def down
    remove_column :rims, :size
  end
end
