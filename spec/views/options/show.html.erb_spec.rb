require 'rails_helper'

RSpec.describe "options/show", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
