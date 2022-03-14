require 'rails_helper'

RSpec.describe ActivityTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'activity_types',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ActivityTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ActivityType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:activity_type) { create(:activity_type) }

    let(:payload) do
      {
        data: {
          id: activity_type.id.to_s,
          type: 'activity_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ActivityTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { activity_type.reload.updated_at }
      # .and change { activity_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:activity_type) { create(:activity_type) }

    let(:instance) do
      ActivityTypeResource.find(id: activity_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ActivityType.count }.by(-1)
    end
  end
end
