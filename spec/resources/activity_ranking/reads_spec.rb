require 'rails_helper'

RSpec.describe ActivityRankingResource, type: :resource do
  describe 'serialization' do
    let!(:activity_ranking) { create(:activity_ranking) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(activity_ranking.id)
      expect(data.jsonapi_type).to eq('activity_rankings')
    end
  end

  describe 'filtering' do
    let!(:activity_ranking1) { create(:activity_ranking) }
    let!(:activity_ranking2) { create(:activity_ranking) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: activity_ranking2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([activity_ranking2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:activity_ranking1) { create(:activity_ranking) }
      let!(:activity_ranking2) { create(:activity_ranking) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            activity_ranking1.id,
            activity_ranking2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            activity_ranking2.id,
            activity_ranking1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
