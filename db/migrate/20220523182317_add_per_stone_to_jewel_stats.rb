class AddPerStoneToJewelStats < ActiveRecord::Migration[7.0]
  def change
    add_column :jewel_stats, :per_stone, :jsonb
  end
end
