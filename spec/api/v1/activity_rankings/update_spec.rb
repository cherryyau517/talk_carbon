require 'rails_helper'

RSpec.describe "activity_rankings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/activity_rankings/#{activity_ranking.id}", payload
  end

  describe 'basic update' do
    let!(:activity_ranking) { create(:activity_ranking) }

    let(:payload) do
      {
        data: {
          id: activity_ranking.id.to_s,
          type: 'activity_rankings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ActivityRankingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { activity_ranking.reload.attributes }
    end
  end
end
