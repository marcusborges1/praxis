require 'rails_helper'

RSpec.describe "evaluation_models/index", type: :view do
  before(:each) do
    assign(:evaluation_models, FactoryGirl.create_list(:evaluation_model, 2))
  end

  it "renders a list of evaluation_models" do
    allow(view).to receive_messages(will_paginate: nil)
    render
  end
end
