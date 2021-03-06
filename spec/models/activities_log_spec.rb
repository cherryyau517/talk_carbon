require "rails_helper"

RSpec.describe ActivitiesLog, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:activity) }

    it { should have_many(:comments) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_many(:commenters) }
  end

  describe "Validations" do
    it { should validate_presence_of(:activity_id) }

    it { should validate_presence_of(:activity_remarks) }

    it { should validate_presence_of(:addition) }

    it { should validate_presence_of(:carbon_amount) }

    it { should validate_presence_of(:date) }

    it { should validate_presence_of(:user_id) }
  end
end
