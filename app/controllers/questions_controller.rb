class QuestionsController < ApplicationController
  def index
    @questions =  Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @quetion = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]

    if @question.save
      flash[:notice] = "Question was saved"
      redirect_to @question
    else
      flash.now[:alert] = "The question was not saved, please try again."
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    @question.title = params[:question][:title]
    @question.body = params[:question][:body]

    if @question.save
      flash[:notice] = "The Question was updated"
      redirect_to @question
    else
      flash.now[:alert] = "The question was not save. Try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was successfully deleted."
      redirect_to questions_path
    else
      flash[:alert] = "There was an error deleting the question."
      render :show
    end
  end
end
