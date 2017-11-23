require 'rails_helper'

RSpec.describe 'positions/show', type: :view do
  before(:each) do
    @position = assign(:position, FactoryGirl.create(:position, name: 'Gerente', context: 'project'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Gerente/).and match(/Projeto/)
  end
end
