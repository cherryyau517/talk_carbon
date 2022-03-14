require "rails_helper"

RSpec.describe ActivityTypeResource, type: :resource do
  describe "serialization" do
    let!(:activity_type) { create(:activity_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(activity_type.id)
      expect(data.jsonapi_type).to eq("activity_types")
    end
  end

  describe "filtering" do
    let!(:activity_type1) { create(:activity_type) }
    let!(:activity_type2) { create(:activity_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: activity_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([activity_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:activity_type1) { create(:activity_type) }
      let!(:activity_type2) { create(:activity_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      activity_type1.id,
                                      activity_type2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      activity_type2.id,
                                      activity_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
