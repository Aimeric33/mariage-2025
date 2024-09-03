class GuestsController < ApplicationController
  skip_before_action :authenticate_user!

  def edit
    @guest = Guest.find(params[:id])
  end
end
