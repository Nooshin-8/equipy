class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :price, :location, :user, presence: true
  validates :price, numericality: { only_integer: true }
end
