class Pledge < ActiveRecord::Base
  belongs_to :backer, class_name: 'User'
  belongs_to :reward
  has_many :projects, through: :rewards

  def pledge_total
    @pledges = Pledge.find()
  end
end
