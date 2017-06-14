require 'rails_helper'

RSpec.describe "sectors/show", type: :view do
  before(:each) do
    @sector = assign(:sector, Sector.create!(name: "Name"))
  end

  it "renders attributes in <p>" do
    render
  end
end
