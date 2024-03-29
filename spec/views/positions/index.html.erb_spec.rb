require 'rails_helper'

RSpec.describe 'positions/index', type: :view do
  before(:each) do
    assign(:positions, [
             FactoryGirl.create(:position, name: 'Assessor', context: 'institutional'),
             FactoryGirl.create(:position, name: 'Gerente', context: 'project')
           ])
  end

  it 'renders a list of positions' do
    allow(view).to receive_messages(will_paginate: nil)
    render
    assert_select 'tr>th', text: 'Nome', count: 1

    assert_select 'tr>td', text: 'Assessor', count: 1
    assert_select 'tr>td', text: 'Gerente', count: 1
  end
end
