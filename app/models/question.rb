class Question < ActiveRecord::Base
  # Associations
  belongs_to :user, :counter_cache => true
  
  # scopes
  scope :free, lambda { where(["credit = 0 AND money = 0.00"]) }
  scope :paid, lambda { where(["credit <> 0 OR money <> 0.00"])}
  default_scope order("created_at DESC")
end
