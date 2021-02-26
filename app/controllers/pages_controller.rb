class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def concept
    @beers = Beer.all
  end

  def target
    @beers = Beer.all
  end

  def la_ptite_chopine
    @beers = Beer.all
  end

  def design_en_featuring
    @beers = Beer.all
  end


end
