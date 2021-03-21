class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @user = current_user
    @article = Article.new
  end

  def create
    @user = current_user
    @article = @user.articles.new(article_params)
    @article.user = @user
    if
      @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
