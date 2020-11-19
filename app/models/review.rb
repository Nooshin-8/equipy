class Review < ApplicationRecord
  belongs_to :equipment

  validates :title, :equipment, :rating, presence: true
  validates :rating, numericality: true
  validates :rating, inclusion: { in: 1..5 }
end
