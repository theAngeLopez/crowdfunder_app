class Project < ActiveRecord::Base

  has_many :reviews, as: :reviewable
  belongs_to :owner, class_name: 'User'
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges, class_name: 'User'

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, :start_date, :end_date, :funding_goal,  presence: true
  validates :owner, presence: true

  def pledge_total
    pledges.sum(:amount)
  end

  def owner_name
    owner.full_name
  end
end
