require "rails_helper"

RSpec.describe ActivitiesLogResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "activities_logs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActivitiesLogResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ActivitiesLog.count }.by(1)
    end
  end

  describe "updating" do
    let!(:activities_log) { create(:activities_log) }

    let(:payload) do
      {
        data: {
          id: activities_log.id.to_s,
          type: "activities_logs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActivitiesLogResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { activities_log.reload.updated_at }
      # .and change { activities_log.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:activities_log) { create(:activities_log) }

    let(:instance) do
      ActivitiesLogResource.find(id: activities_log.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ActivitiesLog.count }.by(-1)
    end
  end
end
