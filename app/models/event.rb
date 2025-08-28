class Event < ApplicationRecord
  geocoded_by :address

  has_many_attached :file
  has_many :events_registrations, dependent: :destroy
  has_many :users, through: :events_registrations, dependent: :destroy
  has_many :favorites
  # has_many :favorited_by_users, through: :favorites, source: :user

  after_validation :geocode, if: :will_save_change_to_address?
  TAGS = ["Festif", "Creatif", "Foodies", "Culturel", "Chill", "Nature", "Gratuit", "Entre_0_et_40_euros", "Plus_de_40_euros"]
  TAGS_MOOD = ["Festif", "Creatif", "Foodies", "Culturel", "Chill", "Nature", ]
  TAGS_BUDGET = ["Gratuit", "Entre_0_et_40_euros", "Plus_de_40_euros"]
end
