class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color
      t.integer :mileage
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
