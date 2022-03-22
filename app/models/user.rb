class User < ApplicationRecord
  has_many :list, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
