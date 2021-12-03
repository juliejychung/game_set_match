class Api::V1::LessonsController < Api::V1::GraphitiController
  def index
    lessons = LessonResource.all(params)
    respond_with(lessons)
  end

  def show
    lesson = LessonResource.find(params)
    respond_with(lesson)
  end

  def create
    lesson = LessonResource.build(params)

    if lesson.save
      render jsonapi: lesson, status: 201
    else
      render jsonapi_errors: lesson
    end
  end

  def update
    lesson = LessonResource.find(params)

    if lesson.update_attributes
      render jsonapi: lesson
    else
      render jsonapi_errors: lesson
    end
  end

  def destroy
    lesson = LessonResource.find(params)

    if lesson.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: lesson
    end
  end
end
