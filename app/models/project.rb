class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges, class_name: 'User'

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, :start_date, :end_date, :funding_goal,  presence: true
end
