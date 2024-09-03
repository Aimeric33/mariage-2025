class GuestsController < ApplicationController
  skip_before_action :authenticate_user!

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(guest_params)
    redirect_to rsvp_path, notice: "RSVP bien reçu(s), merci ❤️ !"
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email, :phone, :address)
  end
end
