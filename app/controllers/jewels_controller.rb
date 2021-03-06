class JewelsController < ApplicationController
  def show
    @jewel = Jewel.find(params[:id])
  end

  def destroy
    JewelDestroyer.call(params[:id])

    redirect_to root_path, status: :see_other
  end
end
