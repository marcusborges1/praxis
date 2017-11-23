require 'rails_helper'

RSpec.describe 'evaluations/show', type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, FactoryGirl.create(:evaluation))
    @answer_groups = assign(:answer_groups, @evaluation.answer_groups.order(:user_id))
  end

  it 'renders attributes in <p>' do
    render
  end
end
