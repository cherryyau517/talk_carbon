require "rails_helper"

RSpec.describe "followings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/followings/#{following.id}", params: params
  end

  describe "basic fetch" do
    let!(:following) { create(:following) }

    it "works" do
      expect(FollowingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("followings")
      expect(d.id).to eq(following.id)
    end
  end
end
