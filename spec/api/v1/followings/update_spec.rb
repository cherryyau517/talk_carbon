require 'rails_helper'

RSpec.describe "followings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/followings/#{following.id}", payload
  end

  describe 'basic update' do
    let!(:following) { create(:following) }

    let(:payload) do
      {
        data: {
          id: following.id.to_s,
          type: 'followings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FollowingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { following.reload.attributes }
    end
  end
end
