class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :cars, through: :reservations, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true
end
