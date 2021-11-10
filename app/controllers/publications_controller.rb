class PublicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publication, only: [:edit, :update, :destroy]
  def index
    @publications = Publication.all
    @publication = Publication.new
    @answer = Answer.new
    @beers = Beer.all
    @stores = Store.all
    @users = User.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @user = current_user
    @publication = @user.publications.new(publication_params)
    @publication.user = @user
    if
      @publication.save
      redirect_to publications_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to publications_path(anchor: "@publication")
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to publications_path
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end
  def publication_params
    params.require(:publication).permit(:content, :photo, :link, :video)
  end
end
