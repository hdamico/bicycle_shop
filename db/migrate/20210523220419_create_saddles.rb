class CreateSaddles < ActiveRecord::Migration[6.1]
  def change
    create_table :saddles do |t|
      t.references :bicycle, null: false
      t.string :color

      t.timestamps
    end
  end
end
