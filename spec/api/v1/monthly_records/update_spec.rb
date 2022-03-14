require 'rails_helper'

RSpec.describe "monthly_records#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/monthly_records/#{monthly_record.id}", payload
  end

  describe 'basic update' do
    let!(:monthly_record) { create(:monthly_record) }

    let(:payload) do
      {
        data: {
          id: monthly_record.id.to_s,
          type: 'monthly_records',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MonthlyRecordResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { monthly_record.reload.attributes }
    end
  end
end
