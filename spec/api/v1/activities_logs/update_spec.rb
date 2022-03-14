require 'rails_helper'

RSpec.describe "activities_logs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/activities_logs/#{activities_log.id}", payload
  end

  describe 'basic update' do
    let!(:activities_log) { create(:activities_log) }

    let(:payload) do
      {
        data: {
          id: activities_log.id.to_s,
          type: 'activities_logs',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ActivitiesLogResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { activities_log.reload.attributes }
    end
  end
end
