class Api::V1::ActivityTypesController < Api::V1::GraphitiController
  def index
    activity_types = ActivityTypeResource.all(params)
    respond_with(activity_types)
  end

  def show
    activity_type = ActivityTypeResource.find(params)
    respond_with(activity_type)
  end

  def create
    activity_type = ActivityTypeResource.build(params)

    if activity_type.save
      render jsonapi: activity_type, status: 201
    else
      render jsonapi_errors: activity_type
    end
  end

  def update
    activity_type = ActivityTypeResource.find(params)

    if activity_type.update_attributes
      render jsonapi: activity_type
    else
      render jsonapi_errors: activity_type
    end
  end

  def destroy
    activity_type = ActivityTypeResource.find(params)

    if activity_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: activity_type
    end
  end
end
