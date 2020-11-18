class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :accepted, inclusion: { in: %w[pending accepted refused] }
end
