class ChangeColumnsFromNotNullableToNullable < ActiveRecord::Migration[6.1]
  def up
    change_column :wheels, :bicycle_id, :bigint, null: true
    change_column :saddles, :bicycle_id, :bigint, null: true
    change_column :rims, :wheel_id, :bigint, null: true
  end

  def down
    change_column :wheels, :bicycle_id, :bigint, null: false
    change_column :saddles, :bicycle_id, :bigint, null: false
    change_column :rims, :wheel_id, :bigint, null: false
  end
end
