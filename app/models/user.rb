class User < ApplicationRecord
  geocoded_by :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events_registrations, dependent: :destroy
  has_many :events, through: :events_registrations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :favorited_events, through: :favorites, source: :event
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_validation :geocode, if: :will_save_change_to_address?

end
