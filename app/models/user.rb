class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :list, dependent: :destroy
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true
  def self.authenticate(email, password)
    user = User.find_for_authentication(email:)
    user.try(:valid_password?, password) ? user : nil
  end
end
