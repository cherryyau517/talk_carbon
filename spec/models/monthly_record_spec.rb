require 'rails_helper'

RSpec.describe MonthlyRecord, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:monthly_net_carbon) }

    it { should validate_presence_of(:user_id) }

    end
end
