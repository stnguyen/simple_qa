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
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    redirect_to @question, :notice => "Your answer has been deleted!"
  end

  def make_vote
    @answer = Answer.find(params[:id])
    
    value = params[:value].to_sym
    if value == :unvote
      current_user.unvote(@answer)
    else
      current_user.vote(:votee => @answer, :value => value)
    end
    
    redirect_to question_path(@answer.question), :notice => "Your vote/unvote is successfully submitted."
  end
end
