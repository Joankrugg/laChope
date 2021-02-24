class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :concept ]

  def home
  end

  def concept
  end
end
