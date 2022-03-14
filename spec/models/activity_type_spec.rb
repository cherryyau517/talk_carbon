require "rails_helper"

RSpec.describe ActivityType, type: :model do
  describe "Direct Associations" do
    it { should have_many(:activity_rankings) }

    it { should have_many(:activities_logs) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:activity_name) }
  end
end
