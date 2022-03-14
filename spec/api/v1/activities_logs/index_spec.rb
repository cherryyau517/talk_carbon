require 'rails_helper'

RSpec.describe "activities_logs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activities_logs", params: params
  end

  describe 'basic fetch' do
    let!(:activities_log1) { create(:activities_log) }
    let!(:activities_log2) { create(:activities_log) }

    it 'works' do
      expect(ActivitiesLogResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['activities_logs'])
      expect(d.map(&:id)).to match_array([activities_log1.id, activities_log2.id])
    end
  end
end
