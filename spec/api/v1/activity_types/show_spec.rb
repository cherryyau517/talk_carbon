require 'rails_helper'

RSpec.describe "activity_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_types/#{activity_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:activity_type) { create(:activity_type) }

    it 'works' do
      expect(ActivityTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('activity_types')
      expect(d.id).to eq(activity_type.id)
    end
  end
end
