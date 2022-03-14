require "rails_helper"

RSpec.describe "activity_rankings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/activity_rankings/#{activity_ranking.id}"
  end

  describe "basic destroy" do
    let!(:activity_ranking) { create(:activity_ranking) }

    it "updates the resource" do
      expect(ActivityRankingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ActivityRanking.count }.by(-1)
      expect { activity_ranking.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
