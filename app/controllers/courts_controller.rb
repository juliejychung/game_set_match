class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  def index
    @courts = Court.all
  end

  # GET /courts/1
  def show
  end

  # GET /courts/new
  def new
    @court = Court.new
  end

  # GET /courts/1/edit
  def edit
  end

  # POST /courts
  def create
    @court = Court.new(court_params)

    if @court.save
      redirect_to @court, notice: 'Court was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courts/1
  def update
    if @court.update(court_params)
      redirect_to @court, notice: 'Court was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courts/1
  def destroy
    @court.destroy
    redirect_to courts_url, notice: 'Court was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_court
      @court = Court.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def court_params
      params.require(:court).permit(:state, :city, :neighborhood, :name)
    end
end
