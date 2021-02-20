class BookingsController < ApplicationController
    def index
        @bookings = current_user.bookings
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def new
        @flat = Flat.find(params[:flat_id])
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(bookings_params)
        @flat = Flat.find(params[:flat_id])
        @booking.user = current_user
        @booking.flat = @flat
        if @booking.save
            redirect_to booking_path(@booking)
        else
            render 'new'
        end
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to bookings_path
    end

    private

    def bookings_params
        params.require(:booking).permit(:start_date, :end_date)
    end
end
