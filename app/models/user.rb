class User < ApplicationRecord
  has_many :flats, dependent: :destroy
end
