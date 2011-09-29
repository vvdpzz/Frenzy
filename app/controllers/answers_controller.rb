class AnswersController < ApplicationController
  respond_to :html
  
  def create
    question = Question.find params[:answer][:question_id]
    answer = current_user.answers.build(params[:answer])
    flash[:notice] = "Answer was successfully created." if answer.save
    respond_with(question)
  end
end
