require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  let(:sector) { FactoryGirl.create(:sector) }
  let(:position_ids) { FactoryGirl.create_list(:position, 1).map(&:id).first }

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      sector_id: sector.id,
      position_ids: position_ids,
      email: Faker::Internet.email,
      password: "123qwe!@#",
      password_confirmation: "123qwe!@#"
    }
  }

  let(:invalid_attributes) { { name: "" } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :show, params: {id: user.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :edit, params: {id: user.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: {user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "New Name"
        }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(user.name).to eq(new_attributes[:name])
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end

  describe "GET #monitors" do
    let(:users) { FactoryGirl.create_list(:user, 2) }
    let(:sector) { FactoryGirl.create(:sector, name: "GP") }
    let(:position_ids) { FactoryGirl.create_list(:position, 1).map(&:id).first }

    let(:valid_attributes) {
      {
        name: Faker::Name.name,
        sector_id: sector.id,
        position_ids: position_ids,
        email: Faker::Internet.email,
        password: "123qwe!@#",
        password_confirmation: "123qwe!@#"
      }
    }

    it "returns a success response" do
      people_management_member = User.create! valid_attributes
      get :monitors, params: {id: people_management_member.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "PATCH #add_monitors" do
    let(:users) { FactoryGirl.create_list(:user, 2) }
    let(:sector) { FactoryGirl.create(:sector, name: "GP") }
    let(:position_ids) { FactoryGirl.create_list(:position, 1).map(&:id).first }

    let(:valid_attributes) {
      {
        name: Faker::Name.name,
        sector_id: sector.id,
        position_ids: position_ids,
        email: Faker::Internet.email,
        password: "123qwe!@#",
        password_confirmation: "123qwe!@#"
      }
    }

    it "returns a success response" do
      people_management_member = User.create! valid_attributes
      patch :add_monitors, params: {id: people_management_member.id, monitors: users.pluck(:id)}, session: valid_session
      expect(response).to be_success
    end

    xit "updates people monitored for requested user" do
      people_management_member = User.create! valid_attributes
      patch :monitors, params: { id: people_management_member.id, monitors: { "user_id": users } }, session: valid_session
      expect(response).to be_success
    end
  end

end
