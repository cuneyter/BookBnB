class Flat < ApplicationRecord
  # belongs_to :user

  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :max_guest_number, presence: true
end
