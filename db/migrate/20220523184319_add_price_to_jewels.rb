class AddPriceToJewels < ActiveRecord::Migration[7.0]
  def change
    add_column :jewels, :price, :decimal
  end
end
