class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :check_prior_booking, only: [:create]

  def check_prior_booking
    @prior_booking = Booking.where(:user_id => current_user.id, :tour_id => params[:tour_id])
    unless @prior_booking.blank?
      flash[:notice] = "ERROR: Cannot reserve more than one booking for same tour"
      redirect_to root_path and return
    end
  end

  def waitlist_handler(tour_id)

      @tour = Tour.find(tour_id)
      # puts @tour.Name
      seats_available = @tour.avail_seats
      waitlists = Waitlist.where(tour_id: tour_id)

      waitlists.each do |waitlist|
        if waitlist.no_of_seats <= seats_available
          seats_available = seats_available - waitlist.no_of_seats
          @booking = Booking.new
          @booking.no_of_seats = waitlist.no_of_seats
          @booking.user_id = waitlist.user_id
          @booking.tour_id = waitlist.tour_id
          @booking.save
          @tour.avail_seats = seats_available
          @tour.avail_waitlist = @tour.avail_waitlist - waitlist.no_of_seats
          @tour.save
          waitlist.destroy
        end
    end
  end

  # GET /bookings
  # GET /bookings.json
  def index
    # @booking = Booking.where(user_id: current_user.id)
    if current_user.is_admin
      @bookings = Booking.all
    elsif current_user.is_agent
      # tour_owner = Tour.where(id: params[:tour_id]).pluck(:user_id)
      @bookings = Booking.where(tour_id: params[:tour_id])#.where(user_id: tour_owner)
    elsif current_user.is_customer
      @bookings = Booking.where(user_id: current_user.id)
    end

  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @tour_id = initial_booking_params["tour_id"]
    @tour = Tour.find(@tour_id)
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create

    ## Add logic for completed trips

    booking_params[:user_id] = current_user.id
    # puts booking_params[:user_id]
    @booking = Booking.new(booking_params.except(:option))
    @tour = Tour.find(booking_params[:tour_id])
    @overbooked = false
    ready = false

    # puts @booking.no_of_seats
    # puts @tour.avail_seats
    if @booking.no_of_seats > @tour.avail_seats
      @overbooked = true
    end



    # puts booking_params
    respond_to do |format|
      if @overbooked
        if booking_params['option'] == "Book only avaialble seats"
          @booking.no_of_seats = @tour.avail_seats
          message = "We were able to book " + @booking.no_of_seats.to_s + " seats for you."
          ready = true
        elsif booking_params['option'] == "Book all avaialble seats and waitlist remaining"
          waitlist_count = @booking.no_of_seats - @tour.avail_seats
          @booking.no_of_seats = @tour.avail_seats
          waitlist = Waitlist.new({"user_id" => current_user.id, "tour_id" => booking_params[:tour_id], "no_of_seats" => waitlist_count}).save
          ready = true
          @tour.avail_waitlist = waitlist_count
          @tour.save
        elsif booking_params['option'] == "Add all seats to Waitlist"
          waitlist_count = @booking.no_of_seats
          @booking.no_of_seats = 0
          waitlist = Waitlist.new({"user_id" => current_user.id, "tour_id" => booking_params[:tour_id], "no_of_seats" => waitlist_count}).save
          ready = true
          @tour.avail_waitlist = waitlist_count
          @tour.save
        else
        end
      end

      if(@booking.no_of_seats <1)
        message = 'Unable to confirm any seats.'
      end

      if (ready or not @overbooked) and (@booking.no_of_seats <1 or @booking.save)
        @tour.avail_seats = @tour.avail_seats - @booking.no_of_seats
        @tour.save
        format.html { redirect_to @booking, notice: message }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end

  end
end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    current_seat_count = @booking.no_of_seats
    requested_seat_count = booking_params[:no_of_seats].to_i

    @tour = Tour.find(@booking.tour_id)
    
    respond_to do |format|
      if requested_seat_count > current_seat_count
        @booking.errors.add(:no_of_seats, "You can only reduce your ticket count. You have " + current_seat_count.to_s + " seats currently.")
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      elsif requested_seat_count == 0
        @booking.errors.add(:no_of_seats, "If you want to have 0 seats, please cancel the reservation.")
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      elsif @booking.update(booking_params)
            @tour.avail_seats = @tour.avail_seats - requested_seat_count + current_seat_count
            @tour.save
            waitlist_handler(@booking.tour_id)
            format.html { redirect_to @booking, notice: 'Customer booking was successfully updated to ' + requested_seat_count.to_s + " seats."}
            format.json { render :show, status: :ok, location: @booking }
      else
            format.html { render :edit }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @tour = Tour.find(@booking.tour_id)
    @tour.avail_seats = @tour.avail_seats + @booking.no_of_seats
    @tour.save
    @booking.destroy
    waitlist_handler(@tour.id)
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:no_of_seats, :user_id, :tour_id, :option)
    end

    def initial_booking_params
      params.permit(:tour_id)
    end
end
