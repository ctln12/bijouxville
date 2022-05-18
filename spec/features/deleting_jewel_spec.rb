require 'rails_helper'

RSpec.describe 'Users can delete a jewel', type: :feature do
  scenario 'successfully' do
    gold = Material.create!(name: 'Gold')
    ruby = Stone.create!(name: 'Ruby')
    chopard = Jeweler.create!(name: 'Chopard')
    ring = Jewel.create!(name: 'Ring', jeweler: chopard)
    JewelStone.create!(jewel: ring, stone: ruby)
    JewelMaterial.create!(jewel: ring, material: gold)
    jeweler_count = Jeweler.count
    jewel_count = Jewel.count
    expected_stones = Stone.all.map(&:name)
    expected_materials = Material.all.map(&:name)
    visit root_path

    within('ul#jewels') do
      click_link 'Ring'
    end
    click_link 'Delete'

    page.find('p', exact_text: "#{jeweler_count} #{'jeweler'.pluralize(jeweler_count)}")
    page.find('p', exact_text: "#{jewel_count - 1} #{'jewel'.pluralize(jewel_count - 1)}")
    within('ol#stones') do
      actual_stones = all('li span.name').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
    within('ol#materials') do
      actual_materials = all('li span.name').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
  end
end
