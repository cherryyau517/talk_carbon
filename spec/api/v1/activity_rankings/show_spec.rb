require "rails_helper"

RSpec.describe "activity_rankings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_rankings/#{activity_ranking.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:activity_ranking) { create(:activity_ranking) }

    it "works" do
      expect(ActivityRankingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("activity_rankings")
      expect(d.id).to eq(activity_ranking.id)
    end
  end
end
