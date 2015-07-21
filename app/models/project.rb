class Project < ActiveRecord::Base

  has_many :reviews

  belongs_to :owner, class_name: 'User'
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges, class_name: 'User'

end
