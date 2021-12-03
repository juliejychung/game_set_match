class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  def index
    @q = Lesson.ransack(params[:q])
    @lessons = @q.result(:distinct => true).includes(:coach, :player, :court).page(params[:page]).per(10)
  end

  # GET /lessons/1
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      message = 'Lesson was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @lesson, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
    message = "Lesson was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to lessons_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lesson_params
      params.require(:lesson).permit(:coach_id, :player_id, :date, :time, :court_id)
    end
end
