require 'rails_helper'

RSpec.describe "followings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/followings/#{following.id}"
  end

  describe 'basic destroy' do
    let!(:following) { create(:following) }

    it 'updates the resource' do
      expect(FollowingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Following.count }.by(-1)
      expect { following.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
