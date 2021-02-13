class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(bookings_params)
        # @booking.flat = Flat.find(params[:flat_id])
        @booking.user_id = 1
        @booking.flat_id = 1
        if @booking.save
            redirect_to booking_path(@booking)
        else
            render 'new'
        end
    end

    private

    def bookings_params
        params.require(:booking).permit(:start_date, :end_date)
    end
end
