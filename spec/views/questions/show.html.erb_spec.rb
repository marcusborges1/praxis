require 'rails_helper'

RSpec.describe 'questions/show', type: :view do
  before(:each) do
    @question = assign(:question, FactoryGirl.create(:question))
  end

  it 'renders attributes in <p>' do
    render
  end
end
