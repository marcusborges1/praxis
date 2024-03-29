require 'rails_helper'

RSpec.describe 'questions/edit', type: :view do
  before(:each) do
    @question = assign(:question, FactoryGirl.create(:question))
  end

  it 'renders the edit question form' do
    render

    assert_select 'form[action=?][method=?]', question_path(@question), 'post' do
      assert_select 'textarea[name=?]', 'question[description]'
    end
  end
end
