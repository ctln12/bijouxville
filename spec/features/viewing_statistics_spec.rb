require 'rails_helper'

RSpec.describe 'Users can view jewels statistics', type: :feature do
  scenario 'including the total sum by stone and material types' do
    gold = Material.create!(name: 'Gold')
    ruby = Stone.create!(name: 'Ruby')
    chopard = Jeweler.create!(name: 'Chopard')
    ring = Jewel.create!(name: 'Ring', jeweler: chopard)
    JewelStone.create!(jewel: ring, stone: ruby)
    JewelMaterial.create!(jewel: ring, material: gold)
    jewel_stats = JewelStat.create!(date: Date.today, total_quantity: Jewel.count) # missing total_price

    visit root_path

    page.find('table#total-jewels td', exact_text: jewel_stats.total_quantity)
    within('table#materials') do
      expected_materials = Material.all.map { |material| "#{material.name} #{JewelMaterial.where(material: material).count}" }
      actual_materials = all('tr:not(:first-child)').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
    within('table#stones') do
      expected_stones = Stone.all.map { |stone| "#{stone.name} #{JewelStone.where(stone: stone).uniq.count}" }
      actual_stones = all('tr:not(:first-child)').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
  end
end
