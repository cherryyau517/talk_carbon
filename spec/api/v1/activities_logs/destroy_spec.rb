require 'rails_helper'

RSpec.describe "activities_logs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/activities_logs/#{activities_log.id}"
  end

  describe 'basic destroy' do
    let!(:activities_log) { create(:activities_log) }

    it 'updates the resource' do
      expect(ActivitiesLogResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ActivitiesLog.count }.by(-1)
      expect { activities_log.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
