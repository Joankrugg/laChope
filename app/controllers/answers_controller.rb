class AnswersController < ApplicationController
  before_action :get_publication, only: [:edit, :update, :destroy]
  before_action :set_answer, only: [:edit, :update]
  def new
    # we need @publication in our `simple_form_for`
    @answer = Answer.new
  end

  def create
    @user = current_user
    @answer = @user.answers.new(answer_params)
    # we need `publication_id` to associate answer with corresponding publication
    @publication = Publication.find(params[:publication_id])
    @answer.publication = @publication
    if @answer.save
      redirect_to publications_path(anchor: "@publication")
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
       @answer.publication = @publication
      redirect_to publications_path
    else
      render :edit
    end
  end

  private
  def get_publication
    @publication = Publication.find(params[:publication_id])
  end

  def set_answer
    @answer = @publication.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :photo, :link)
  end
end
