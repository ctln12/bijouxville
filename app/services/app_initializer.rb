class AppInitializer < ApplicationService
  def call
    jeweler = Jeweler.create!(name: 'Tiffany & Co.')
    seed_materials
    seed_stones
    add_jewels(jeweler)
    JewelStat.create!(date: Date.today, total_quantity: Jewel.count)
  end

  private

  def seed_materials
    materials = ['Gold', 'Silver', 'Stainless steele']
    materials.each do |material|
      Material.create!(name: material)
    end
  end

  def seed_stones
    stones = %w[Ruby Sapphire Emerald]
    stones.each do |stone|
      Stone.create!(name: stone)
    end
  end

  def add_jewels(jeweler)
    jewels = %w[Fingerring Earring Necklace Bracelet]
    jewels.each do |jewel|
      a_jewel = Jewel.create!(name: jewel, jeweler: jeweler)
      JewelMaterial.create!(jewel: a_jewel, material: Material.all.sample)
      JewelStone.create!(jewel: a_jewel, stone: Stone.all.sample)
    end
  end
end
