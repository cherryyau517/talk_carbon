require 'rails_helper'

RSpec.describe "activity_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/activity_types/#{activity_type.id}"
  end

  describe 'basic destroy' do
    let!(:activity_type) { create(:activity_type) }

    it 'updates the resource' do
      expect(ActivityTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ActivityType.count }.by(-1)
      expect { activity_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
