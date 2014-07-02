class AddIndexToManufacturers < ActiveRecord::Migration
  def change
    add_index :manufacturers, [:country, :name], unique: true
  end
end
