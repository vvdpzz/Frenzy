class Answer < ActiveRecord::Base
  # Associations
  belongs_to :user, :counter_cache => true
  belongs_to :question, :counter_cache => true
  
  acts_as_voteable
end
