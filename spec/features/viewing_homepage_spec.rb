require 'rails_helper'

RSpec.describe 'Users can view the homepage', type: :feature do
  scenario 'with jewelers, stones and materials details' do
    gold = Material.create!(name: 'Gold')
    ruby = Stone.create!(name: 'Ruby')
    chopard = Jeweler.create!(name: 'Chopard')
    ring = Jewel.create!(name: 'Ring', jeweler: chopard)
    JewelStone.create!(jewel: ring, stone: ruby)
    JewelMaterial.create!(jewel: ring, material: gold)

    visit root_path

    page.find('p', exact_text: "#{Jeweler.count} #{'jeweler'.pluralize(Jeweler.count)}")
    within('ol#stones') do
      expected_stones = Stone.all.map(&:name)
      actual_stones = all('li span.name').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
    within('ol#materials') do
      expected_materials = Material.all.map(&:name)
      actual_materials = all('li span.name').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
  end
end
