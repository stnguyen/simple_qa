class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    @answer.user = current_user
    
    if @answer.save
      redirect_to @answer.question, :notice => "Your answer is succssfully submitted. Thanks!"
    else
      redirect_to @answer.question, :alert => "Your answer is not saved!" 
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
  end

  def make_vote
  end
end