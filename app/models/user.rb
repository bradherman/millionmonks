class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_voter
  
  has_many  :wisdoms
  has_karma :wisdoms
  
  # authlogic handles validation of presence & validity of password and login
  
  def admin?
    self.admin
  end
  
  def name
    "#{self.first_name}"
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end
