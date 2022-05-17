class CreateStones < ActiveRecord::Migration[7.0]
  def change
    create_table :stones do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end