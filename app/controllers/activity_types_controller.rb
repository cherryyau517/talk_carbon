class ActivityTypesController < ApplicationController
  before_action :set_activity_type, only: %i[show edit update destroy]

  def index
    @q = ActivityType.ransack(params[:q])
    @activity_types = @q.result(distinct: true).includes(:activities_logs,
                                                         :activity_rankings).page(params[:page]).per(10)
  end

  def show
    @activity_ranking = ActivityRanking.new
    @activities_log = ActivitiesLog.new
  end

  def new
    @activity_type = ActivityType.new
  end

  def edit; end

  def create
    @activity_type = ActivityType.new(activity_type_params)

    if @activity_type.save
      redirect_to @activity_type,
                  notice: "Activity type was successfully created."
    else
      render :new
    end
  end

  def update
    if @activity_type.update(activity_type_params)
      redirect_to @activity_type,
                  notice: "Activity type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @activity_type.destroy
    redirect_to activity_types_url,
                notice: "Activity type was successfully destroyed."
  end

  private

  def set_activity_type
    @activity_type = ActivityType.find(params[:id])
  end

  def activity_type_params
    params.require(:activity_type).permit(:activity_name)
  end
end
