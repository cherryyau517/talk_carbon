require "rails_helper"

RSpec.describe Following, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:follower) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:followed_id) }

    it { should validate_presence_of(:follower_id) }
  end
end
