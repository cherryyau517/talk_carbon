require 'rails_helper'

RSpec.describe "monthly_records#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/monthly_records/#{monthly_record.id}"
  end

  describe 'basic destroy' do
    let!(:monthly_record) { create(:monthly_record) }

    it 'updates the resource' do
      expect(MonthlyRecordResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { MonthlyRecord.count }.by(-1)
      expect { monthly_record.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
