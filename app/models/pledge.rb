class Pledge < ActiveRecord::Base

  belongs_to :backer, class_name: 'User'
  belongs_to :reward
  belongs_to :project

end
