class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :price, :location, :photos, :user, presence: true
  validates :price, numericality: { only_integer: true }
end
