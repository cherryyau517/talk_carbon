class ActivityRankingsController < ApplicationController
  before_action :set_activity_ranking, only: [:show, :edit, :update, :destroy]

  # GET /activity_rankings
  def index
    @activity_rankings = ActivityRanking.all
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
      redirect_to @activity_ranking, notice: 'Activity ranking was successfully created.'
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
    redirect_to activity_rankings_url, notice: 'Activity ranking was successfully destroyed.'
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
