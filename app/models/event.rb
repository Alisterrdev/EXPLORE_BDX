class Event < ApplicationRecord
  geocoded_by :address

  has_many_attached :file
  has_many :events_registrations, dependent: :destroy
  has_many :users, through: :events_registrations, dependent: :destroy
  has_many :favorites
  # has_many :favorited_by_users, through: :favorites, source: :user

  after_validation :geocode, if: :will_save_change_to_address?

  TAGS = ["Festif", "Creatif", "Foodies", "Culturel", "Chill", "Nature", "Gratuit", "Entre 0 et 40 euros", "Plus de 40 euros"]

end
