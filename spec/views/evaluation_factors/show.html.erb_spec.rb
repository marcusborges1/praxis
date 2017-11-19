require 'rails_helper'

RSpec.describe 'evaluation_factors/show', type: :view do
  before(:each) do
    @evaluation_factor = assign(:evaluation_factor, EvaluationFactor.create!(name: 'Fator'))
  end

  it 'renders attributes in <p>' do
    render
  end
end
