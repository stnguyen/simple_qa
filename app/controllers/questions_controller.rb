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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    
    if @question.update_attributes(params[:question])
      redirect_to question_path(@question), 
                  :notice => "Your question has been updated successfully!"
    else
      render "edit"
    end
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
    
    value = params[:value].to_sym
    if value == :unvote
      current_user.unvote(@question)
    else
      current_user.vote(:votee => @question, :value => value)
    end
    
    redirect_to question_path(@question), :notice => "Your vote/unvote is successfully submitted."
  end
end
