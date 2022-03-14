class ActivityRankingsController < ApplicationController
  before_action :set_activity_ranking, only: [:show, :edit, :update, :destroy]

  # GET /activity_rankings
  def index
    @q = ActivityRanking.ransack(params[:q])
    @activity_rankings = @q.result(:distinct => true).includes(:user, :activity).page(params[:page]).per(10)
  end

  # GET /activity_rankings/1
  def show
  end

  # GET /activity_rankings/new
  def new
    @activity_ranking = ActivityRanking.new
  end

  # GET /activity_rankings/1/edit
  def edit
  end

  # POST /activity_rankings
  def create
    @activity_ranking = ActivityRanking.new(activity_ranking_params)

    if @activity_ranking.save
      message = 'ActivityRanking was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @activity_ranking, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /activity_rankings/1
  def update
    if @activity_ranking.update(activity_ranking_params)
      redirect_to @activity_ranking, notice: 'Activity ranking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activity_rankings/1
  def destroy
    @activity_ranking.destroy
    message = "ActivityRanking was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to activity_rankings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_ranking
      @activity_ranking = ActivityRanking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_ranking_params
      params.require(:activity_ranking).permit(:user_id, :activity_id, :date, :month, :carbon_amount)
    end
end
