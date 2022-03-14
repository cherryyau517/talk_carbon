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
      should validate_inclusion_of(:month).in_array(["1", "2", "3", "4", "5", "6",
                                                     "7", "8", "9", "10", "11", "12"])
    }

    it { should validate_presence_of(:monthly_net_carbon) }

    it { should validate_presence_of(:user_id) }
  end
end
