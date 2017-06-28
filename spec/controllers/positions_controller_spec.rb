require 'rails_helper'

RSpec.describe PositionsController, type: :controller do
  login_user
  
  let(:user) { User.create(name: "User") }

  let(:valid_attributes) { { name: "Diretor" } }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      position = Position.create! valid_attributes
      get :show, params: {id: position.to_param}, session: valid_session
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
      position = Position.create! valid_attributes
      get :edit, params: {id: position.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Gestor"}
      }

      it "updates the requested position" do
        position = Position.create! valid_attributes
        put :update, params: {id: position.to_param, position: new_attributes}, session: valid_session
        position.reload
        expect(position.name).to eq("Gestor")
      end

      it "redirects to the position" do
        position = Position.create! valid_attributes
        put :update, params: {id: position.to_param, position: valid_attributes}, session: valid_session
        expect(response).to redirect_to(position)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        position = Position.create! valid_attributes
        put :update, params: {id: position.to_param, position: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested position" do
      position = Position.create! valid_attributes
      expect {
        delete :destroy, params: {id: position.to_param}, session: valid_session
      }.to change(Position, :count).by(-1)
    end

    it "redirects to the positions list" do
      position = Position.create! valid_attributes
      delete :destroy, params: {id: position.to_param}, session: valid_session
      expect(response).to redirect_to(positions_url)
    end
  end

end
