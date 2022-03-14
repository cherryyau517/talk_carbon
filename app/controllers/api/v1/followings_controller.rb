class Api::V1::FollowingsController < Api::V1::GraphitiController
  def index
    followings = FollowingResource.all(params)
    respond_with(followings)
  end

  def show
    following = FollowingResource.find(params)
    respond_with(following)
  end

  def create
    following = FollowingResource.build(params)

    if following.save
      render jsonapi: following, status: 201
    else
      render jsonapi_errors: following
    end
  end

  def update
    following = FollowingResource.find(params)

    if following.update_attributes
      render jsonapi: following
    else
      render jsonapi_errors: following
    end
  end

  def destroy
    following = FollowingResource.find(params)

    if following.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: following
    end
  end
end
