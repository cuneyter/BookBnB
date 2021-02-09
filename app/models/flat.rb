class Flat < ApplicationRecord
  belongs_to :user
  # has_many :bookings

  validates :address_line_1, :address_line_2, :postcode, :city, presence: true
  validates :price, :max_guest_number, presence: true, numericality: true
end
