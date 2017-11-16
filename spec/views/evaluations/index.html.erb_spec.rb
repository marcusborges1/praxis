require 'rails_helper'

RSpec.describe "evaluations/index", type: :view do
  before(:each) do
    assign(:evaluations, FactoryGirl.create_list(:evaluation, 1))
  end

  it "renders a list of evaluations" do
    allow(view).to receive_messages(will_paginate: nil)
    render
  end
end
