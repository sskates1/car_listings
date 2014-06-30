class AddManufacturerRefToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :manufacturer, index: true
  end
end
