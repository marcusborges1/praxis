require 'rails_helper'

RSpec.describe 'sectors/index', type: :view do
  before(:each) do
    assign(:sectors, FactoryGirl.create_list(:sector, 2))
  end

  it 'renders a list of sectors' do
    allow(view).to receive_messages(will_paginate: nil)
    render
  end
end
