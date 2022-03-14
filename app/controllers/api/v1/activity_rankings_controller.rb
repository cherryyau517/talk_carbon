class Api::V1::ActivityRankingsController < Api::V1::GraphitiController
  def index
    activity_rankings = ActivityRankingResource.all(params)
    respond_with(activity_rankings)
  end

  def show
    activity_ranking = ActivityRankingResource.find(params)
    respond_with(activity_ranking)
  end

  def create
    activity_ranking = ActivityRankingResource.build(params)

    if activity_ranking.save
      render jsonapi: activity_ranking, status: 201
    else
      render jsonapi_errors: activity_ranking
    end
  end

  def update
    activity_ranking = ActivityRankingResource.find(params)

    if activity_ranking.update_attributes
      render jsonapi: activity_ranking
    else
      render jsonapi_errors: activity_ranking
    end
  end

  def destroy
    activity_ranking = ActivityRankingResource.find(params)

    if activity_ranking.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: activity_ranking
    end
  end
end
