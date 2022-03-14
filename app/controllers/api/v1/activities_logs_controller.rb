class Api::V1::ActivitiesLogsController < Api::V1::GraphitiController
  def index
    activities_logs = ActivitiesLogResource.all(params)
    respond_with(activities_logs)
  end

  def show
    activities_log = ActivitiesLogResource.find(params)
    respond_with(activities_log)
  end

  def create
    activities_log = ActivitiesLogResource.build(params)

    if activities_log.save
      render jsonapi: activities_log, status: 201
    else
      render jsonapi_errors: activities_log
    end
  end

  def update
    activities_log = ActivitiesLogResource.find(params)

    if activities_log.update_attributes
      render jsonapi: activities_log
    else
      render jsonapi_errors: activities_log
    end
  end

  def destroy
    activities_log = ActivitiesLogResource.find(params)

    if activities_log.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: activities_log
    end
  end
end
