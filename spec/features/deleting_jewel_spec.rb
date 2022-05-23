require 'rails_helper'

RSpec.describe 'Users can delete a jewel', type: :feature do
  scenario 'successfully' do
    AppInitializer.call
    jeweler_count = Jeweler.count
    expected_materials = Material.all.map(&:name)
    expected_stones = Stone.all.map(&:name)
    visit root_path

    click_link Jewel.last.name
    click_link 'Delete'

    jewel_stats = JewelStat.find_by(date: Date.today)
    page.find('table#total-jewelers td', exact_text: jeweler_count)
    page.find('table#total-jewels td:nth-child(1)', exact_text: jewel_stats.total_quantity)
    within('table#materials') do
      actual_materials = all('td:first-child').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
    within('table#stones') do
      actual_stones = all('td:first-child').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
  end
end
