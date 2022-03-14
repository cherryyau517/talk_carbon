require 'rails_helper'

RSpec.describe FollowingResource, type: :resource do
  describe 'serialization' do
    let!(:following) { create(:following) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(following.id)
      expect(data.jsonapi_type).to eq('followings')
    end
  end

  describe 'filtering' do
    let!(:following1) { create(:following) }
    let!(:following2) { create(:following) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: following2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([following2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:following1) { create(:following) }
      let!(:following2) { create(:following) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            following1.id,
            following2.id
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
            following2.id,
            following1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
