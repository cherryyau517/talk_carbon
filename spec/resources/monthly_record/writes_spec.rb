require "rails_helper"

RSpec.describe MonthlyRecordResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "monthly_records",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MonthlyRecordResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { MonthlyRecord.count }.by(1)
    end
  end

  describe "updating" do
    let!(:monthly_record) { create(:monthly_record) }

    let(:payload) do
      {
        data: {
          id: monthly_record.id.to_s,
          type: "monthly_records",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MonthlyRecordResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { monthly_record.reload.updated_at }
      # .and change { monthly_record.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:monthly_record) { create(:monthly_record) }

    let(:instance) do
      MonthlyRecordResource.find(id: monthly_record.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { MonthlyRecord.count }.by(-1)
    end
  end
end
