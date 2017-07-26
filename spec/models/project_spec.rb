require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to have_many(:project_allocations) }
  it { is_expected.to have_many(:users).through(:project_allocations) }
  it { is_expected.to belong_to(:leader).class_name("User") }
  it { is_expected.to validate_presence_of(:name) }

  describe "#all_allocated_users" do
    before :each do
      @leader = FactoryGirl.create(:user)
      @users = FactoryGirl.create_list(:user, 3)
      @project = FactoryGirl.create(:project_with_users, leader: @leader, users: @users)
    end

    it "returns both leader and non leaders" do
      all_allocated_users = @users << @leader
      expect(@project.all_allocated_users).to match_array(all_allocated_users)
    end
  end
end
