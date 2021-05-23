class CreateWheels < ActiveRecord::Migration[6.1]
  def change
    create_table :wheels do |t|
      t.references :bicycle, null: false
      t.integer :size

      t.timestamps
    end
    add_index :wheels, :size, unique: true
  end
end
