require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project_with_users, name: 'Name'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
