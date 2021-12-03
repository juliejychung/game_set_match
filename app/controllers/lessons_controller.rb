class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show edit update destroy]

  def index
    @q = Lesson.ransack(params[:q])
    @lessons = @q.result(distinct: true).includes(:coach, :player,
                                                  :court).page(params[:page]).per(10)
  end

  def show; end

  def new
    @lesson = Lesson.new
  end

  def edit; end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      message = "Lesson was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @lesson, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: "Lesson was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    message = "Lesson was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to lessons_url, notice: message
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:coach_id, :player_id, :date, :time,
                                   :court_id)
  end
end
