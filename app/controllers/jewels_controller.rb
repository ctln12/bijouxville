class JewelsController < ApplicationController
  def index
    @jewels = Jewel.all
  end

  def show
    @jewel = Jewel.find(params[:id])
  end

  def destroy
    @jewel = Jewel.find(params[:id])
    @jewel.destroy

    redirect_to root_path, status: :see_other
  end
end
