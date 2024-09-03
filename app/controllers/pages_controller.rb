class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def infos_pratiques
  end

  def a_visiter
  end

  def rsvp
    respond_to do |format|
      format.html
      format.turbo_stream { render turbo_stream: turbo_stream.append("guests", partial: "guests/new_guest") }
    end
  end

  def mentions_legales
  end
end
