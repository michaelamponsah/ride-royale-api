class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.string :picture
      t.integer :price
      

      t.timestamps
    end
  end
end
