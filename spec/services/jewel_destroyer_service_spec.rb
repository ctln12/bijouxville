require 'rails_helper'

RSpec.describe 'JewelDestroyer service', type: :model do
  describe '#call' do
    it 'deletes a jewel and updates the jewel statistics' do
      chopard = Jeweler.create!(name: 'Chopard')
      ring = Jewel.create!(name: 'Ring', jeweler: chopard)
      JewelStat.create!(date: Date.today, total_quantity: Jewel.count) # missing total_price

      JewelDestroyer.call(ring.id)

      expect(Jewel.find_by(name: ring.name)).to be_nil
      expect(JewelStat.find_by(date: Date.today).total_quantity).to eq(Jewel.count)
      # expect(stats.total_price).to eq()
    end
  end
end
