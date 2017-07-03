require 'rails_helper'

RSpec.describe SectorsController, type: :controller do
  login_user

  let(:valid_attributes) { { name: "Valid" } }
  let(:invalid_attributes) { { name: "Not invalid yet" } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      sector = Sector.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sector = Sector.create! valid_attributes
      get :show, params: {id: sector.to_param}, session: valid_session
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
      sector = Sector.create! valid_attributes
      get :edit, params: {id: sector.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Sector" do
        expect {
          post :create, params: {sector: valid_attributes}, session: valid_session
        }.to change(Sector, :count).by(1)
      end

      it "redirects to the created sector" do
        post :create, params: {sector: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Sector.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "New Name" }
      }

      it "updates the requested sector" do
        sector = Sector.create! valid_attributes
        put :update, params: {id: sector.to_param, sector: new_attributes}, session: valid_session
        sector.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the sector" do
        sector = Sector.create! valid_attributes
        put :update, params: {id: sector.to_param, sector: valid_attributes}, session: valid_session
        expect(response).to redirect_to(sector)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested sector" do
      sector = Sector.create! valid_attributes
      expect {
        delete :destroy, params: {id: sector.to_param}, session: valid_session
      }.to change(Sector, :count).by(-1)
    end

    it "redirects to the sectors list" do
      sector = Sector.create! valid_attributes
      delete :destroy, params: {id: sector.to_param}, session: valid_session
      expect(response).to redirect_to(sectors_url)
    end
  end

end
