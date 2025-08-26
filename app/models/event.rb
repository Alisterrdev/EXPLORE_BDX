class Event < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :events_registrations, dependent: :destroy
end
