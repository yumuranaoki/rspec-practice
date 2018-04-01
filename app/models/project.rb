class Project < ApplicationRecord
  #validation
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }

  #association
  belongs_to :user
end
