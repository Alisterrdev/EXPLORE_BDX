class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :event_registrations, dependent: :destroy
  has_many :events, through: :events_registrations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :favorited_events, through: :favorites, source: :event
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
