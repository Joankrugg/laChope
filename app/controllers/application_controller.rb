class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  before_action :set_targets
  before_action :set_articles
  before_action :set_stickers
  before_action :set_feeds
  before_action :set_typicals
  before_action :set_user
  before_action :set_projects
  before_action :set_conversations

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def set_targets
    @beers = Beer.all
  end

  def set_articles
    @articles = Article.all
  end

  def set_stickers
    @stickers = Sticker.all
  end
  def set_feeds
    @feeds = Feed.all
  end
  def set_typicals
    @typical_beers = TypicalBeer.all
  end
  def set_user
    @u = User.find_by_id(1)
  end
  def set_projects
    @projects = Project.all
  end
  def set_conversations
    @conversations = Conversation.all
  end

  private
    # Its important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

end
