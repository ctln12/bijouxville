require 'rails_helper'

RSpec.describe 'Users can view jewels statistics', type: :feature do
  scenario 'including the total sum by stone and material types' do
    AppInitializer.call

    visit root_path

    jewel_stats = JewelStat.find_by(date: Date.today)
    page.find('table#total-jewels td', exact_text: jewel_stats.total_quantity)
    within('table#materials') do
      expected_materials = Material.all.map { |material| "#{material.name} #{jewel_stats.per_material[material.name]['quantity']} #{jewel_stats.per_material[material.name]['value']}" }
      actual_materials = all('tr:not(:first-child)').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
    within('table#stones') do
      expected_stones = Stone.all.map { |stone| "#{stone.name} #{jewel_stats.per_stone[stone.name]['quantity']} #{jewel_stats.per_stone[stone.name]['value']}" }
      actual_stones = all('tr:not(:first-child)').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
  end
end
