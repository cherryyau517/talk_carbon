require "rails_helper"

RSpec.describe MonthlyRecordResource, type: :resource do
  describe "serialization" do
    let!(:monthly_record) { create(:monthly_record) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(monthly_record.id)
      expect(data.jsonapi_type).to eq("monthly_records")
    end
  end

  describe "filtering" do
    let!(:monthly_record1) { create(:monthly_record) }
    let!(:monthly_record2) { create(:monthly_record) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: monthly_record2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([monthly_record2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:monthly_record1) { create(:monthly_record) }
      let!(:monthly_record2) { create(:monthly_record) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      monthly_record1.id,
                                      monthly_record2.id,
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
                                      monthly_record2.id,
                                      monthly_record1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
