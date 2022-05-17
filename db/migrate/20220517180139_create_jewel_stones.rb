class CreateJewelStones < ActiveRecord::Migration[7.0]
  def change
    create_table :jewel_stones do |t|
      t.references :jewel, null: false, foreign_key: true
      t.references :stone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
