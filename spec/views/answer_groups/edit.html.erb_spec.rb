require 'rails_helper'

RSpec.describe 'answer_groups/edit', type: :view do
  before(:each) do
    @answer_group = assign(:answer_group, FactoryGirl.create(:answer_group))
    @questions = assign(:questions, FactoryGirl.create_list(:question, 2))
  end

  it 'renders the edit answer_group form' do
    render
    assert_select 'form[action=?][method=?]', answer_group_path(@answer_group), 'post' do
    end
  end
end
