class Project < ActiveRecord::Base
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, :start_date, :end_date, :funding_goal,  presence: true
end
