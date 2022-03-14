require 'rails_helper'

RSpec.describe "activities_logs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activities_logs/#{activities_log.id}", params: params
  end

  describe 'basic fetch' do
    let!(:activities_log) { create(:activities_log) }

    it 'works' do
      expect(ActivitiesLogResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('activities_logs')
      expect(d.id).to eq(activities_log.id)
    end
  end
end
