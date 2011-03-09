class AnswersController < ApplicationController
  def create
    @question = Question.find_by_slug(params[:question_id])
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

    redirect_to question_url(params[:question_id]), :notice => "Your answer has been deleted!"
  end
  
  def unvote
    @answer = Answer.find(params[:id])
    current_user.unvote(@answer)
    redirect_to question_url(params[:question_id]), :notice => "Unvote is successfully submitted."
  end
  
  def vote_down
    @answer = Answer.find(params[:id])
    current_user.vote(@answer, :down)
    redirect_to question_url(params[:question_id]), :notice => "Vote down is successfully submitted."
  end
  
  def vote_up
    @answer = Answer.find(params[:id])
    current_user.vote(@answer, :up)
    redirect_to question_url(params[:question_id]), :notice => "Vote up is successfully submitted."
  end
end
