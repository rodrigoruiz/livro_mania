class Rating < ActiveRecord::Base
  attr_accessible :evaluator_id, :rated_user_id, :vote
  
  validates :evaluator, :presence => true
  validates :rated_user, :presence => true
  validates :vote, :inclusion => [true, false]
  validates_uniqueness_of :evaluator_id, :scope => :rated_user_id
  
  belongs_to :evaluator, :class_name => 'User'
  belongs_to :rated_user, :class_name => 'User'
end
