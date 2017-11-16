require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, FactoryGirl.create_list(:project, 2, name: "Name"))
  end

  it "renders a list of projects" do
    allow(view).to receive_messages(will_paginate: nil)
    render
    assert_select "tr>td", text: "Name", count: 2
  end
end
