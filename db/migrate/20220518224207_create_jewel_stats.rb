class CreateJewelStats < ActiveRecord::Migration[7.0]
  def change
    create_table :jewel_stats do |t|
      t.date :date
      t.integer :total_quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end
