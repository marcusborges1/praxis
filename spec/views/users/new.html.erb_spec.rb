require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    @positions = assign(:positions, Position.all)
    assign(:user, User.new)
    allow(view).to receive(:current_user).and_return(FactoryGirl.build(:user))
    FactoryGirl.create_list(:user, 2, sector: FactoryGirl.build(:sector, :people_management))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
    end
  end
end
