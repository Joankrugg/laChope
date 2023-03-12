class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @beers = Beer.all
    @newsletter = Newsletter.new
  end

  def concept
    @beers = Beer.all
  end

end
