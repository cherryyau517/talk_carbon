require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:activity_logs) }

    it { should have_many(:monthly_records) }

    it { should have_many(:activity_rankings) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    it { should have_many(:followings) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:user_name) }
  end
end
