require 'rails_helper'

RSpec.describe 'projects/new', type: :view do
  before(:each) do
    assign(:project, Project.new)
  end

  it 'renders new project form' do
    render
  end
end
