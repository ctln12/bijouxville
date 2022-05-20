class PagesController < ApplicationController
  def home
    @jewel_stats = JewelStat.find_by(date: Date.today)
  end
end
