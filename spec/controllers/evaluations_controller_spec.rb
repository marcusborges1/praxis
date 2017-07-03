require 'rails_helper'
require 'date'

RSpec.describe EvaluationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Evaluation. As you add validations to Evaluation, be sure to
  # adjust the attributes here as well.
  let(:sector) { Sector.create!(name: "Setor 1") }
  let(:position) { Position.create!(name: "Cargo 1") }
  let(:evaluation_model) { EvaluationModel.create!(name: "Modelo 1", sector_id: sector.id, position_id: position.id) }
  let(:start_date) { Date.today }
  let(:finish_date) { Date.tomorrow }

  let(:valid_attributes) {
    {
      start_date: start_date,
      finish_date: finish_date,
      evaluation_model: evaluation_model
    }
  }

  let(:invalid_attributes) {
    {
      start_date: nil,
      finish_date: nil,
      evaluation_model_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EvaluationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Evaluation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      evaluation = Evaluation.create! valid_attributes
      get :show, params: {id: evaluation.to_param}, session: valid_session
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
      evaluation = Evaluation.create! valid_attributes
      get :edit, params: {id: evaluation.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      skip "creates a new Evaluation" do
        expect {
          post :create, params: {evaluation: valid_attributes}, session: valid_session
        }.to change(Evaluation, :count).by(1)
      end

      skip "redirects to the created evaluation" do
        post :create, params: {evaluation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Evaluation.last)
      end
    end

    context "with invalid params" do
      skip "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {evaluation: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested evaluation" do
        evaluation = Evaluation.create! valid_attributes
        put :update, params: {id: evaluation.to_param, evaluation: new_attributes}, session: valid_session
        evaluation.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the evaluation" do
        evaluation = Evaluation.create! valid_attributes
        put :update, params: {id: evaluation.to_param, evaluation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(evaluation)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        evaluation = Evaluation.create! valid_attributes
        put :update, params: {id: evaluation.to_param, evaluation: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested evaluation" do
      evaluation = Evaluation.create! valid_attributes
      expect {
        delete :destroy, params: {id: evaluation.to_param}, session: valid_session
      }.to change(Evaluation, :count).by(-1)
    end

    it "redirects to the evaluations list" do
      evaluation = Evaluation.create! valid_attributes
      delete :destroy, params: {id: evaluation.to_param}, session: valid_session
      expect(response).to redirect_to(evaluations_url)
    end
  end
end
