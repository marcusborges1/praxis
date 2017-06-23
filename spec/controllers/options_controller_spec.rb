require 'rails_helper'

RSpec.describe OptionsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      option = Option.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      option = Option.create! valid_attributes
      get :show, params: {id: option.to_param}, session: valid_session
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
      option = Option.create! valid_attributes
      get :edit, params: {id: option.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Option" do
        expect {
          post :create, params: {option: valid_attributes}, session: valid_session
        }.to change(Option, :count).by(1)
      end

      it "redirects to the created option" do
        post :create, params: {option: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Option.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {option: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested option" do
        option = Option.create! valid_attributes
        put :update, params: {id: option.to_param, option: new_attributes}, session: valid_session
        option.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the option" do
        option = Option.create! valid_attributes
        put :update, params: {id: option.to_param, option: valid_attributes}, session: valid_session
        expect(response).to redirect_to(option)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        option = Option.create! valid_attributes
        put :update, params: {id: option.to_param, option: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested option" do
      option = Option.create! valid_attributes
      expect {
        delete :destroy, params: {id: option.to_param}, session: valid_session
      }.to change(Option, :count).by(-1)
    end

    it "redirects to the options list" do
      option = Option.create! valid_attributes
      delete :destroy, params: {id: option.to_param}, session: valid_session
      expect(response).to redirect_to(options_url)
    end
  end

end
