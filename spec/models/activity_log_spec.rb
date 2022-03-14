require "rails_helper"

RSpec.describe ActivityLog, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:activity_type) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
