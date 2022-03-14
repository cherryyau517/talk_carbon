class ActivityRankingsController < ApplicationController
  before_action :set_activity_ranking, only: %i[show edit update destroy]

  def index
    @q = ActivityRanking.ransack(params[:q])
    @activity_rankings = @q.result(distinct: true).includes(:user,
                                                            :activity).page(params[:page]).per(10)
  end

  def show; end

  def new
    @activity_ranking = ActivityRanking.new
  end

  def edit; end

  def create
    @activity_ranking = ActivityRanking.new(activity_ranking_params)

    if @activity_ranking.save
      message = "ActivityRanking was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @activity_ranking, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @activity_ranking.update(activity_ranking_params)
      redirect_to @activity_ranking,
                  notice: "Activity ranking was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @activity_ranking.destroy
    message = "ActivityRanking was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to activity_rankings_url, notice: message
    end
  end

  private

  def set_activity_ranking
    @activity_ranking = ActivityRanking.find(params[:id])
  end

  def activity_ranking_params
    params.require(:activity_ranking).permit(:user_id, :activity_id, :date,
                                             :month, :carbon_amount)
  end
end
