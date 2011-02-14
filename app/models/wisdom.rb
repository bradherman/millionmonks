class Wisdom < ActiveRecord::Base
  acts_as_voteable
  belongs_to  :user
  cattr_reader :per_page
  @@per_page = 10
end
