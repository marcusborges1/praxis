require 'rails_helper'

RSpec.describe 'evaluation_models/edit', type: :view do
  before(:each) do
    @evaluation_model = assign(:evaluation_model, FactoryGirl.create(:evaluation_model))
  end

  it 'renders the edit evaluation_model form' do
    render
    assert_select 'form[action=?][method=?]', evaluation_model_path(@evaluation_model), 'post' do
      assert_select 'input#evaluation_model_name[name=?]', 'evaluation_model[name]'
    end
  end
end
