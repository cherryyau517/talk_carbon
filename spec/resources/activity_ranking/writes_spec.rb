require 'rails_helper'

RSpec.describe ActivityRankingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'activity_rankings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ActivityRankingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ActivityRanking.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:activity_ranking) { create(:activity_ranking) }

    let(:payload) do
      {
        data: {
          id: activity_ranking.id.to_s,
          type: 'activity_rankings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ActivityRankingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { activity_ranking.reload.updated_at }
      # .and change { activity_ranking.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:activity_ranking) { create(:activity_ranking) }

    let(:instance) do
      ActivityRankingResource.find(id: activity_ranking.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ActivityRanking.count }.by(-1)
    end
  end
end
