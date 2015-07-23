class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, allow_blank: true
  validates :password, confirmation: true
  validates :email, uniqueness: true

  def project_owner
    owner = Project.find(owner_id)
    return owner
  end
end
