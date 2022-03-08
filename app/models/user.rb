class User < ApplicationRecord
  has_many :list, dependent: :destroy
end
