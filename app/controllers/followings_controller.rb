class FollowingsController < ApplicationController
  before_action :current_user_must_be_following_follower, only: [:edit, :update, :destroy] 

  before_action :set_following, only: [:show, :edit, :update, :destroy]

  # GET /followings
  def index
    @followings = Following.page(params[:page]).per(10)
  end

  # GET /followings/1
  def show
  end

  # GET /followings/new
  def new
    @following = Following.new
  end

  # GET /followings/1/edit
  def edit
  end

  # POST /followings
  def create
    @following = Following.new(following_params)

    if @following.save
      message = 'Following was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @following, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /followings/1
  def update
    if @following.update(following_params)
      redirect_to @following, notice: 'Following was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /followings/1
  def destroy
    @following.destroy
    message = "Following was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to followings_url, notice: message
    end
  end


  private

  def current_user_must_be_following_follower
    set_following
    unless current_user == @following.follower
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_following
      @following = Following.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def following_params
      params.require(:following).permit(:follower_id, :followed_id)
    end
end
