class ListingController < ApplicationController
  def index
    @listings = Listing.all # по умолчанибю

    if params[:first_day].present? && params[:last_day].present?
      start_date = Date.parse(params[:first_day])
      end_date   = Date.parse(params[:last_day])

      # Находим все listing_id забронированных объектов в указанный период
      booked_listing_ids = Booking.where("first::date <= ? AND second::date >= ?", end_date, start_date)
                              .pluck(:listing_id)

      @listings = @listings.where.not(id: booked_listing_ids)
    end

    if params[:numPeop].present?
      @listings = @listings.where("people >= ?", params[:numPeop]) # по умолчанибю
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @busyDates = @listing.booking
  end

  def new
    # url формы создания
    @listing = Listing.new

    @character = Parameter.all
  end

  def edit
    @listing  = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def create
    # id конкретного пользователя
    @listing = current_user.listing.build(listing_params)

    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  private

  # защита
  def listing_params
    params.require(:listing).permit(:title, :price, :city, :description, :people,  parameter_ids: [])
  end
end
