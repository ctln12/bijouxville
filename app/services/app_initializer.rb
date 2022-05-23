class AppInitializer < ApplicationService
  def call
    jeweler = Jeweler.create!(name: 'Tiffany & Co.')
    seed_materials
    seed_stones
    add_jewels(jeweler)
    JewelStat.create!(
      date: Date.today,
      total_quantity: Jewel.count,
      per_material: jewels_per_material,
      per_stone: jewels_per_stone
    )
  end

  private

  def seed_materials
    materials = ['Gold', 'Silver', 'Stainless steele']
    materials.each do |material|
      Material.create!(name: material, base_cost: rand(200...2_000))
    end
  end

  def seed_stones
    stones = %w[Ruby Sapphire Emerald]
    stones.each do |stone|
      Stone.create!(name: stone, price: rand(100...1_000))
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

  def jewels_per_material
    jewels_per_material = {}
    Material.all.each do |material|
      quantity = JewelMaterial.where(material: material).count
      jewels_per_material[material.name] = {
        quantity: quantity,
        value: quantity * material.base_cost
      }
    end
    jewels_per_material
  end

  def jewels_per_stone
    jewels_per_stone = {}
    Stone.all.each do |stone|
      quantity = JewelStone.where(stone: stone).count
      jewels_per_stone[stone.name] = {
        quantity: quantity,
        value: quantity * stone.price
      }
    end
    jewels_per_stone
  end
end
