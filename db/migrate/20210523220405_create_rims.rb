class CreateRims < ActiveRecord::Migration[6.1]
  def up
    create_table :rims do |t|
      t.references :wheel, null: false
      t.string :color

      t.timestamps
    end
  end

  def down
    drop_table(:rims)
  end
end
