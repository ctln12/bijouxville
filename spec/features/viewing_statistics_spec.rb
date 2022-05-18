require 'rails_helper'

RSpec.describe 'Users can view jewels statistics', type: :feature do
  scenario 'including the total sum by stone and material types' do
    gold = Material.create!(name: 'Gold')
    ruby = Stone.create!(name: 'Ruby')
    chopard = Jeweler.create!(name: 'Chopard')
    ring = Jewel.create!(name: 'Ring', jeweler: chopard)
    JewelStone.create!(jewel: ring, stone: ruby)
    JewelMaterial.create!(jewel: ring, material: gold)

    visit root_path

    page.find('p', exact_text: "#{Jewel.count} #{'jewel'.pluralize(Jewel.count)}")
    within('ol#stones') do
      expected_stones = Stone.all.map { |stone| "#{stone.name} (#{JewelStone.where(stone: stone).uniq.count})" }
      actual_stones = all('li').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
    within('ol#materials') do
      expected_materials = Material.all.map { |material| "#{material.name} (#{JewelMaterial.where(material: material).count})" }
      actual_materials = all('li').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
  end
end
