require 'rails_helper'

RSpec.describe "followings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/followings", params: params
  end

  describe 'basic fetch' do
    let!(:following1) { create(:following) }
    let!(:following2) { create(:following) }

    it 'works' do
      expect(FollowingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['followings'])
      expect(d.map(&:id)).to match_array([following1.id, following2.id])
    end
  end
end
