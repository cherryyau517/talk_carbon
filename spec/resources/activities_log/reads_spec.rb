require "rails_helper"

RSpec.describe ActivitiesLogResource, type: :resource do
  describe "serialization" do
    let!(:activities_log) { create(:activities_log) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(activities_log.id)
      expect(data.jsonapi_type).to eq("activities_logs")
    end
  end

  describe "filtering" do
    let!(:activities_log1) { create(:activities_log) }
    let!(:activities_log2) { create(:activities_log) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: activities_log2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([activities_log2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:activities_log1) { create(:activities_log) }
      let!(:activities_log2) { create(:activities_log) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      activities_log1.id,
                                      activities_log2.id,
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
                                      activities_log2.id,
                                      activities_log1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
