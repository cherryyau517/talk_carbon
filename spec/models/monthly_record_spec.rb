require "rails_helper"

RSpec.describe MonthlyRecord, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:date) }

    it { should validate_presence_of(:month) }

    it {
      should validate_numericality_of(:month).is_less_than(12).is_greater_than_or_equal_to(1)
    }

    it { should validate_presence_of(:monthly_net_carbon) }

    it { should validate_presence_of(:user_id) }
  end
end
