class User < ActiveRecord::Base
  has_many :pledges
  has_many :rewards, through: :pledges

  has_many :owned_projects, class_name: 'Project'
  has_many :backed_projects, through: :pledges, class_name: 'Project'
end
