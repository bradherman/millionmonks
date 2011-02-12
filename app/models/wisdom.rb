class Wisdom < ActiveRecord::Base
  acts_as_voteable
  belongs_to  :user
  
  attr_accessor :karma
  
  def karma
    self.votes_for - self.votes_against
  end
end
