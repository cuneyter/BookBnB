class Flat < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # has_many :users, through: :bookings

  # validates :address_line_1, :address_line_2, :postcode, :city, presence: true
  # validates :price, :max_guest_number, presence: true, numericality: true
end
