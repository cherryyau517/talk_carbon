require 'rails_helper'

RSpec.describe "monthly_records#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/monthly_records/#{monthly_record.id}", params: params
  end

  describe 'basic fetch' do
    let!(:monthly_record) { create(:monthly_record) }

    it 'works' do
      expect(MonthlyRecordResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('monthly_records')
      expect(d.id).to eq(monthly_record.id)
    end
  end
end
