require "rails_helper"

RSpec.describe FollowingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "followings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FollowingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Following.count }.by(1)
    end
  end

  describe "updating" do
    let!(:following) { create(:following) }

    let(:payload) do
      {
        data: {
          id: following.id.to_s,
          type: "followings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FollowingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { following.reload.updated_at }
      # .and change { following.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:following) { create(:following) }

    let(:instance) do
      FollowingResource.find(id: following.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Following.count }.by(-1)
    end
  end
end
