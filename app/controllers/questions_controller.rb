class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    
    if @question.save
      redirect_to question_path(@question), :notice => "Your question has been submitted successfully!"
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    
    redirect_to questions_path, :notice => "Your question has been deleted!"
  end

end
