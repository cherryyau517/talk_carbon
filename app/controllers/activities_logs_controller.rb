class ActivitiesLogsController < ApplicationController
  before_action :current_user_must_be_activities_log_user, only: [:edit, :update, :destroy] 

  before_action :set_activities_log, only: [:show, :edit, :update, :destroy]

  # GET /activities_logs
  def index
    @activities_logs = ActivitiesLog.page(params[:page]).per(10)
  end

  # GET /activities_logs/1
  def show
    @comment = Comment.new
  end

  # GET /activities_logs/new
  def new
    @activities_log = ActivitiesLog.new
  end

  # GET /activities_logs/1/edit
  def edit
  end

  # POST /activities_logs
  def create
    @activities_log = ActivitiesLog.new(activities_log_params)

    if @activities_log.save
      message = 'ActivitiesLog was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @activities_log, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /activities_logs/1
  def update
    if @activities_log.update(activities_log_params)
      redirect_to @activities_log, notice: 'Activities log was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activities_logs/1
  def destroy
    @activities_log.destroy
    message = "ActivitiesLog was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to activities_logs_url, notice: message
    end
  end


  private

  def current_user_must_be_activities_log_user
    set_activities_log
    unless current_user == @activities_log.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_activities_log
      @activities_log = ActivitiesLog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activities_log_params
      params.require(:activities_log).permit(:activity_id, :date, :time, :activity_remarks, :addition, :carbon_amount, :user_id)
    end
end
