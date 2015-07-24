class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :written_reviews, class_name: 'Review', foreign_key: 'user_id'
  has_many :reviews, as: :reviewable

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :pledges, foreign_key: :backer_id
  has_many :backed_projects, class_name: 'Project', through: :pledges, source: :project

  validates :password, length: { minimum: 8 }, allow_blank: true
  validates :password, confirmation: true
  validates :email, uniqueness: true

  def full_name
    first_name + " " + last_name
  end

end
