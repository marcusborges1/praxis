require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @sector = assign(:sector, Sector.create!(name: "DAF"))
    @user = assign(:user, User.create!(name: "name", sector: @sector))
  end

  it "renders attributes in <p>" do
    render
  end
end
