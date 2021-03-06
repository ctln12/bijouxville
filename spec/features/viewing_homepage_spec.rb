require 'rails_helper'

RSpec.describe 'Users can view the homepage', type: :feature do
  scenario 'with jewelers, stones and materials details' do
    AppInitializer.call

    visit root_path

    page.find('table#total-jewelers td', exact_text: Jeweler.count)
    within('table#materials') do
      expected_materials = Material.all.map(&:name)
      actual_materials = all('td:first-child').map(&:text)
      expect(actual_materials).to match_array(expected_materials)
    end
    within('table#stones') do
      expected_stones = Stone.all.map(&:name)
      actual_stones = all('td:first-child').map(&:text)
      expect(actual_stones).to match_array(expected_stones)
    end
    expect(page).to have_link('Total Jewelers', href: jewelers_path)
    expect(page).to have_link('Materials', href: materials_path)
    expect(page).to have_link('Stones', href: stones_path)
  end
end
