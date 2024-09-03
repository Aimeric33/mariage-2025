class MariagesController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    @mariage = Mariage.find(params[:id])
    @mariage.update(mariage_params)
    redirect_to root_path
  end
end
