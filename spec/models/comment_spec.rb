require 'rails_helper'

RSpec.describe Comment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:commenter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:comment) }

    it { should validate_presence_of(:commenter_id) }

    it { should validate_presence_of(:date) }

    it { should validate_presence_of(:log_id) }

    it { should validate_presence_of(:time) }

    end
end
