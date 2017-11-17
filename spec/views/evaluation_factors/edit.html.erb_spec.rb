require 'rails_helper'

RSpec.describe 'evaluation_factors/edit', type: :view do
  before(:each) do
    @evaluation_factor = assign(:evaluation_factor, EvaluationFactor.create!(name: 'Fator'))
  end

  it 'renders the edit evaluation_factor form' do
    render

    assert_select 'form[action=?][method=?]', evaluation_factor_path(@evaluation_factor), 'post' do
    end
  end
end
