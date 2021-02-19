class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:address_line_1, :postcode, :city, :price, photos: [])
  end
end
