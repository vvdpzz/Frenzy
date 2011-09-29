class QuestionsController < ApplicationController
  respond_to :html
  before_filter :vote_init, :only => [:vote_for, :vote_against]
  
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
  
  def vote_for
    if current_user.credit >= Settings.vote_for_limit and @voted != true
      if @voted == nil
        current_user.vote_for @question
      else
        current_user.vote_exclusively_against @question
      end
    end
  end
  
  def vote_against
    if current_user.credit >= Settings.vote_against_limit and @voted != false
      if @voted == nil
        current_user.vote_against @question
      else
        current_user.vote_exclusively_for @question
      end
    end
  end
  
  protected
    def vote_init
      @question = Question.select("id").find_by_id(params[:id])
      @voted = @question.trivalent_voted_by? current_user
    end
end
