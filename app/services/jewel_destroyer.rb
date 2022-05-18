class JewelDestroyer < ApplicationService
  attr_reader :jewel_id

  def initialize(jewel_id)
    super()
    @jewel_id = jewel_id
  end

  def call
    @jewel = Jewel.find(@jewel_id)
    @jewel.destroy
    @stats = JewelStat.find_by(date: Date.today)
    @stats.update(total_quantity: Jewel.count)
  end
end
