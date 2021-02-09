class Booking < ApplicationRecord
  attr_accessor :id

  def initialize(properties = {})
    @id = properties[:id]
    @flat_id = properties[:flat_id]
    @user_id = properties[:user_id]
    @start_date = properties[:start_date]
    @end_date = properties[:end_date]
  end
end
