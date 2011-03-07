class Wisdom < ActiveRecord::Base
  acts_as_voteable
  belongs_to  :user
  cattr_reader :per_page
  @@per_page = 10
  
  validates_presence_of :quote
  
  def author
    User.find(self.user_id).login
  end
  
  def author_karma
    User.find(self.user_id).karma
  end
end
