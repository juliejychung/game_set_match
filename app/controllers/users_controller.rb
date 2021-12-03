class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:matches, :games, :comments,
                                                :lessons, :sessions).page(params[:page]).per(10)
  end

  def show
    @lesson = Lesson.new
    @comment = Comment.new
    @match = Match.new
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :state, :city,
                                 :neighborhood, :email, :password, :level, :gender, :age, :profile_picture, :coach, :cost_per_hour)
  end
end
