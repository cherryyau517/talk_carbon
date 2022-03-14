require "rails_helper"

RSpec.describe "activity_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/activity_types/#{activity_type.id}", payload
  end

  describe "basic update" do
    let!(:activity_type) { create(:activity_type) }

    let(:payload) do
      {
        data: {
          id: activity_type.id.to_s,
          type: "activity_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ActivityTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { activity_type.reload.attributes }
    end
  end
end
