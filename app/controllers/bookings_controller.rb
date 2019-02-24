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

  def is_seats_available(avail_seats, required_seats)
    if (avail_seats - required_seats) > 0
      true
    else
      false
    end
  end

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    puts @booking
    @@users_id = User.find(params[:user_id])
    @booking.tour = Tour.find(params[:tour_id])
    puts @booking.tour
    @@tours_id = @booking.tour.id
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create

    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    # puts booking_params
    # @booking.users_id = @@users_id
    # @booking.tours_id = @@tours_id
    # @booking = Booking.new(booking_params)
    puts booking_params
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
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
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
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
    @booking.destroy
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
      params.require(:booking).permit(:no_of_seats, :user_id, :tour, :avail_seats)
    end
end
