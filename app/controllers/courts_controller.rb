class CourtsController < ApplicationController
  before_action :set_court, only: %i[show edit update destroy]

  def index
    @q = Court.ransack(params[:q])
    @courts = @q.result(distinct: true).includes(:matches,
                                                 :lessons).page(params[:page]).per(10)
  end

  def show
    @lesson = Lesson.new
    @match = Match.new
  end

  def new
    @court = Court.new
  end

  def edit; end

  def create
    @court = Court.new(court_params)

    if @court.save
      redirect_to @court, notice: "Court was successfully created."
    else
      render :new
    end
  end

  def update
    if @court.update(court_params)
      redirect_to @court, notice: "Court was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @court.destroy
    redirect_to courts_url, notice: "Court was successfully destroyed."
  end

  private

  def set_court
    @court = Court.find(params[:id])
  end

  def court_params
    params.require(:court).permit(:state, :city, :neighborhood, :name)
  end
end
