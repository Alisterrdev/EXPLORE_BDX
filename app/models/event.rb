class Event < ApplicationRecord
  has_many :events_registrations, dependent: :destroy
  has_many :users, through: :events_registrations, dependent: :destroy

  TAGS = ["Festif", "Creatif", "Foodies", "Culturel", "Chill", "Nature", "Gratuit", "Entre 0 et 40 euros", "Plus de 40 euros"]
end
