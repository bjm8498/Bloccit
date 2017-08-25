class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create

    @question = Question.new
    @question.title = params[:title]
    @question.body = params[:body]
    @question.resolved = params[:resolved]

    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question

    else
      flash.now[:alert] = "Sorry the question was not saved please try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "The question has been updated."
      redirect_to @question
    else
      flash.now[:alert] = "The question was not saved please try again."
      render :edit
    end
  end

  def destroy

    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "The question was deleted"
      redirect_to action: :index

    else
      flash.now[:alert] = "The question was not destroyed please try again."
      render :show
    end
  end
end
