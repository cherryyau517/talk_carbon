require 'rails_helper'

RSpec.describe "activity_rankings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/activity_rankings", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'activity_rankings',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ActivityRankingResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ActivityRanking.count }.by(1)
    end
  end
end
