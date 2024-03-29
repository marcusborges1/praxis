require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))
    FactoryGirl.create_list(:user, 2, sector: FactoryGirl.build(:sector, :people_management))
    allow(view).to receive(:current_user).and_return(FactoryGirl.create(:user))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
    end
  end
end
