require "rails_helper"

RSpec.describe "activity_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/activity_types", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "activity_types",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ActivityTypeResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { ActivityType.count }.by(1)
    end
  end
end
