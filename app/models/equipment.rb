class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :price, :location, :photos, :user, presence: true
  validates :price, numericality: { only_integer: true }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # include PgSearch::Model
  # multisearchable against: [:title]

  include PgSearch::Model
  pg_search_scope :main_search, # the name of the method you need to call
  # in the controller when you want to search
    against: [ :title, :category], # it will search by title of the equipment

    using: {
      tsearch: { prefix: true } # <-- now `Basket b` will return something!
    }
    # tsearch is equivalant of @@
    # we enable prefix which means partial words are allowed, but only the begining of the word
end
