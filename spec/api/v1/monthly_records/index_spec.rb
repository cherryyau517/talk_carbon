require 'rails_helper'

RSpec.describe "monthly_records#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/monthly_records", params: params
  end

  describe 'basic fetch' do
    let!(:monthly_record1) { create(:monthly_record) }
    let!(:monthly_record2) { create(:monthly_record) }

    it 'works' do
      expect(MonthlyRecordResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['monthly_records'])
      expect(d.map(&:id)).to match_array([monthly_record1.id, monthly_record2.id])
    end
  end
end
