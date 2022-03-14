require "rails_helper"

RSpec.describe "activity_rankings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_rankings", params: params
  end

  describe "basic fetch" do
    let!(:activity_ranking1) { create(:activity_ranking) }
    let!(:activity_ranking2) { create(:activity_ranking) }

    it "works" do
      expect(ActivityRankingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["activity_rankings"])
      expect(d.map(&:id)).to match_array([activity_ranking1.id,
                                          activity_ranking2.id])
    end
  end
end
