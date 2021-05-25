class CreateWheels < ActiveRecord::Migration[6.1]
  def up
    create_table :wheels do |t|
      t.references :bicycle, null: false
      t.integer :size

      t.timestamps
    end
    add_index :wheels, :size, unique: true
  end

  def down
    drop_table(:wheels)
  end
end
