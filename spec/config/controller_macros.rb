module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      position =   FactoryGirl.create(:position, name: 'Diretor')
      user = FactoryGirl.create(:user,)
      user.positions << position
      sign_in user
    end
  end
end
