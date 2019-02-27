class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only:[:search, :new_search]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  INTEGER_MAX = 2147483647
  SIZE_MAPPING = {
    1 => [0, 500],
    2 => [500, 1500],
    3 => [1500, 3000],
    4 => [3000, INTEGER_MAX]
  }
  PRICE_MAPPING = {
    1 => [0, 100000],
    2 => [100000, 250000],
    3 => [250000, 500000],
    4 => [500000, 1000000],
    5 => [1000000, INTEGER_MAX]
  }

  def new_search
  end

  def search 
    @sp = params.fetch(:search_params, {})
    @tours = Tour.all
    # @tours = @tours.where(:size => SIZE_MAPPING[@sp['size'].to_i][0]...SIZE_MAPPING[@sp['size'].to_i][1]) if @sp['size'].present?
    @tours = @tours.where(['Name LIKE ?', "%#{@sp['Name']}%"]) if @sp['Name'].present? && @sp['Name'] != ""
    @tours = @tours.where(['countries LIKE ?', "%#{@sp['countries']}%"]) if @sp['countries'].present? && @sp['countries'] != ""
    @tours = @tours.where(:price => PRICE_MAPPING[@sp['Price'].to_i][0]...PRICE_MAPPING[@sp['Price'].to_i][1]) if @sp['Price'].present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:Name, :Description, :Price, :start_date, :end_date, :pickup, :total_seats, :avail_seats, :avail_waitlist, :status, :booking_deadline, :countries, :states, :user_id, :image)
    end
end
