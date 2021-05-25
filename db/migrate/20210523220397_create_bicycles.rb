class CreateBicycles < ActiveRecord::Migration[6.1]
  def up
    create_table(:bicycles, &:timestamps)
  end

  def down
    drop_table(:bicycles)
  end
end
