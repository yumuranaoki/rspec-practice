class User < ApplicationRecord
  #validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  #association
  has_many :projects

  def name
    [first_name, last_name].join(' ')
  end
end
