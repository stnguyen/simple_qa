class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    
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
    
    redirect_to questions_url, :notice => "Your question has been deleted!"
  end

  def make_vote
    @question = Question.find(params[:id])
    redirect_to question_path(@question), :alert => "You must be logged-in in order to make a vote!" unless current_user    
    @question.vote(:voter_id => current_user.id, :value => params[:value])
    redirect_to question_path(@question), :notice => "Your vote is successfully submitted."
  end
  
  def cancel_vote
    
  end
end
