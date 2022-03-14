require 'rails_helper'

RSpec.describe "activities_logs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/activities_logs", payload
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
          type: 'activities_logs',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ActivitiesLogResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ActivitiesLog.count }.by(1)
    end
  end
end
