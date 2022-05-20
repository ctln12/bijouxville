require 'rails_helper'

RSpec.describe 'AppInitializer service', type: :model do
  describe '#call' do
    it 'creates a jeweler, jewels, materials, stones and jewel stats' do
      AppInitializer.call

      expect(Jeweler.count).to eq(1)
      expect(Jewel.count).to eq(4)
      expect(Material.count).to eq(3)
      expect(Stone.count).to eq(3)
      expect(JewelMaterial.count).to eq(4)
      expect(JewelStone.count).to eq(4)
      expect(JewelStat.count).to eq(1)
    end
  end
end
