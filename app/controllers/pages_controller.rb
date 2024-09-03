class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def infos_pratiques
  end

  def a_visiter
  end

  def rsvp
  end

  def mentions_legales
  end
end
