require 'rails_helper'

RSpec.describe 'evaluation_cycles/edit', type: :view do
  before(:each) do
    @evaluation_cycle = assign(:evaluation_cycle, FactoryGirl.create(:evaluation_cycle))
  end

  it 'renders the edit evaluation_cycle form' do
    render

    assert_select 'form[action=?][method=?]', evaluation_cycle_path(@evaluation_cycle), 'post' do
    end
  end
end
