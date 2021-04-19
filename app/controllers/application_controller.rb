class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_targets

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def set_targets
    @beers = Beer.all
  end

  def set_articles
    @articles = Article.all
  end

end

