class FollowingsController < ApplicationController
  before_action :current_user_must_be_following_follower,
                only: %i[edit update destroy]

  before_action :set_following, only: %i[show edit update destroy]

  def index
    @q = Following.ransack(params[:q])
    @followings = @q.result(distinct: true).includes(:follower).page(params[:page]).per(10)
  end

  def show; end

  def new
    @following = Following.new
  end

  def edit; end

  def create
    @following = Following.new(following_params)

    if @following.save
      message = "Following was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @following, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @following.update(following_params)
      redirect_to @following, notice: "Following was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @following.destroy
    message = "Following was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to followings_url, notice: message
    end
  end

  private

  def current_user_must_be_following_follower
    set_following
    unless current_user == @following.follower
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_following
    @following = Following.find(params[:id])
  end

  def following_params
    params.require(:following).permit(:follower_id, :followed_id)
  end
end
