class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @questions = Question.desc(:votes_point)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    
    if @question.save
      redirect_to question_path(@question), 
                  :notice => "Your question has been submitted successfully!"
    else
      render "new"
    end
  end

  def edit
    @question = Question.find_by_slug(params[:id])
  end

  def update
    @question = Question.find_by_slug(params[:id])
    
    if @question.update_attributes(params[:question])
      redirect_to question_path(@question), 
                  :notice => "Your question has been updated successfully!"
    else
      render "edit"
    end
  end

  def show
    @question = Question.find_by_slug(params[:id])
    @answer = @question.answers.build
  end

  def destroy
    @question = Question.find_by_slug(params[:id])
    @question.destroy
    
    redirect_to questions_url, :notice => "Your question has been deleted!"
  end

  def unvote
    @question = Question.find_by_slug(params[:id])
    current_user.unvote(@question)
    redirect_to question_path(@question), :notice => "Your unvote is successfully submitted."
  end

  def vote_up
    @question = Question.find_by_slug(params[:id])
    current_user.vote(@question, :up)
    redirect_to question_path(@question), :notice => "Your vote up is successfully submitted."
  end

  def vote_down
    @question = Question.find_by_slug(params[:id])
    current_user.vote(@question, :down)
    redirect_to question_path(@question), :notice => "Your vote down is successfully submitted."
  end
end
