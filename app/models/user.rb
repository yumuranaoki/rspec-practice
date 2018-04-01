class User < ApplicationRecord
  #validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  #association
  has_many :projects

  #scope
  scope :search, ->(name) {
    where("LOWER(first_name) LIKE ?", "%#{name}")
  }

  #インスタンスメソッド
  def name
    [first_name, last_name].join(' ')
  end
end
