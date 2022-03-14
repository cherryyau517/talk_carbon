require "rails_helper"

RSpec.describe "activity_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_types", params: params
  end

  describe "basic fetch" do
    let!(:activity_type1) { create(:activity_type) }
    let!(:activity_type2) { create(:activity_type) }

    it "works" do
      expect(ActivityTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["activity_types"])
      expect(d.map(&:id)).to match_array([activity_type1.id, activity_type2.id])
    end
  end
end
