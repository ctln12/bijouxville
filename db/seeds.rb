# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Jewel.destroy_all
Jeweler.destroy_all
Stone.destroy_all
Material.destroy_all
JewelStone.destroy_all
JewelMaterial.destroy_all

materials = ['Gold', 'Silver', 'Stainless steele']
materials.each do |material|
  Material.create!(name: material)
end

stones = ['Ruby', 'Sapphire', 'Emerald']
stones.each do |stone|
  Stone.create!(name: stone)
end

jewelers = [
  'Tiffany & Co.',
  'Harry Winston',
  'Cartier',
  'Chopard',
  'Van Cleef & Arpels',
  'Graff',
  'David Yurman',
  'Buccellati',
  'Bvlgari',
  'Boucheron'
]
jewelers.each do |jeweler|
  Jeweler.create!(name: jeweler)
end

jewels = ['Fingerring', 'Earring', 'Necklace', 'Bracelet']
jewels.each do |jewel|
  new_jewel = Jewel.create!(name: jewel, jeweler: Jeweler.all.sample)
  rand(4).times do
    JewelStone.create!(jewel: new_jewel, stone: Stone.all.sample)
  end
  JewelMaterial.create!(jewel: new_jewel, material: Material.all.sample)
end
