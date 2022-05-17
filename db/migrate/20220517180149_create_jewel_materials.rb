class CreateJewelMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :jewel_materials do |t|
      t.references :jewel, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
