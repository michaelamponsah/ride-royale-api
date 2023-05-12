class User < ApplicationRecord
  validates username:, presence: true, length: { minimum: 3, maximum: 20 }
  has_many :reservations, dependent: :destroy
  has_many :cars, through: :reservations, dependent: :destroy
end
