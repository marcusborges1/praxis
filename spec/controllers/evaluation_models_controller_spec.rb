require 'rails_helper'

RSpec.describe EvaluationModelsController, type: :controller do
  login_user

  let(:sector) { FactoryGirl.create(:sector) }
  let!(:question_1) { FactoryGirl.create(:question) }
  let!(:question_2) { FactoryGirl.create(:question) }

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      sector_id: sector.id,
      context: "sector",
      question_values_attributes: [
        { value: 1, question_id: question_1.id },
        { value: 2, question_id: question_2.id }
      ]
    }
  }

  let(:invalid_attributes) {
    { name: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EvaluationModelsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      EvaluationModel.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      evaluation_model = EvaluationModel.create! valid_attributes
      get :show, params: {id: evaluation_model.to_param}, session: valid_session
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
      evaluation_model = EvaluationModel.create! valid_attributes
      get :edit, params: {id: evaluation_model.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EvaluationModel" do
        expect {
          post :create, params: {evaluation_model: valid_attributes}, session: valid_session
        }.to change(EvaluationModel, :count).by(1)
      end

      it "redirects to the created evaluation_model" do
        post :create, params: {evaluation_model: valid_attributes}, session: valid_session
        expect(response).to redirect_to(EvaluationModel.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {evaluation_model: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "Novo Nome" }
      }

      it "updates the requested evaluation_model" do
        evaluation_model = EvaluationModel.create! valid_attributes
        put :update, params: {id: evaluation_model.to_param, evaluation_model: new_attributes}, session: valid_session
        evaluation_model.reload
        expect(evaluation_model.name).to eq(new_attributes[:name])
      end

      it "redirects to the evaluation_model" do
        evaluation_model = EvaluationModel.create! valid_attributes
        put :update, params: {id: evaluation_model.to_param, evaluation_model: valid_attributes}, session: valid_session
        expect(response).to redirect_to(evaluation_model)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        evaluation_model = EvaluationModel.create! valid_attributes
        put :update, params: {id: evaluation_model.to_param, evaluation_model: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested evaluation_model" do
      evaluation_model = EvaluationModel.create! valid_attributes
      expect {
        delete :destroy, params: {id: evaluation_model.to_param}, session: valid_session
      }.to change(EvaluationModel, :count).by(-1)
    end

    it "redirects to the evaluation_models list" do
      evaluation_model = EvaluationModel.create! valid_attributes
      delete :destroy, params: {id: evaluation_model.to_param}, session: valid_session
      expect(response).to redirect_to(evaluation_models_url)
    end
  end

end
