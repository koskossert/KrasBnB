class BookingController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    if Booking.where(listing_id: params[:listing_id]).where("first <= ? AND second >= ?", params[:second], params[:first]).exists?
      redirect_back fallback_location: root_path
    else
      @booking = current_user.booking.build(booking_param)

      if @booking.save
        redirect_to @booking.listing
      else
        redirect_back
      end
    end
  end

  private

  def booking_param
    params.permit(:first, :second, :listing_id, :user_id)
  end
end
