class AddNullConstraintToManufacturerId < ActiveRecord::Migration
  def change
    change_column_null :cars, :manufacturer_id, false
  end
end
