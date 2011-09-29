class QuestionsController < ApplicationController
  respond_to :html
  
  def index
    respond_with(@questions = Question.paid)
  end
  
  def free
    respond_with(@questions = Question.free)
  end
  
  def show
    respond_with(@question = Question.find(params[:id]))
  end
  
  def new
    respond_with(@question = Question.new)
  end
  
  def create
    @question = current_user.questions.build(params[:question])
    flash[:notice] = 'Question was successfully created.' if @question.save
    respond_with(@question)
  end
  
  def edit
    respond_with(@question = Question.find(params[:id]))
  end
  
  def update
    @question = current_user.questions.find(params[:id])
    flash[:notice] = 'Question was successfully updated.' if @question.update_attributes(params[:question])
    respond_with(@question)
  end
  
  def destroy
    
  end
end
