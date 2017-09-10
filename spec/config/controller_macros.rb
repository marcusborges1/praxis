module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      admin = FactoryGirl.create(:position, name: 'Diretor')
      user = FactoryGirl.create(:user, :people_management)
      @user = user
      user.positions << admin
      sign_in user
    end
  end
end
