require 'rails_helper'

RSpec.describe EvaluationFactorsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # EvaluationFactor. As you add validations to EvaluationFactor, be sure to
  # adjust the attributes here as well.
  login_user
  let(:valid_attributes) do
    { name: 'Name' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EvaluationFactorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      EvaluationFactor.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      evaluation_factor = EvaluationFactor.create! valid_attributes
      get :show, params: { id: evaluation_factor.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      evaluation_factor = EvaluationFactor.create! valid_attributes
      get :edit, params: { id: evaluation_factor.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new EvaluationFactor' do
        expect do
          post :create, params: { evaluation_factor: valid_attributes }, session: valid_session
        end.to change(EvaluationFactor, :count).by(1)
      end

      it 'redirects to the created evaluation_factor' do
        post :create, params: { evaluation_factor: valid_attributes }, session: valid_session
        expect(response).to redirect_to(EvaluationFactor.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { evaluation_factor: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'New Name' }
      end

      it 'updates the requested evaluation_factor' do
        evaluation_factor = EvaluationFactor.create! valid_attributes
        put :update, params: { id: evaluation_factor.to_param, evaluation_factor: new_attributes }, session: valid_session
        evaluation_factor.reload
        expect(evaluation_factor.name).to eq(new_attributes[:name])
      end

      it 'redirects to the evaluation_factor' do
        evaluation_factor = EvaluationFactor.create! valid_attributes
        put :update, params: { id: evaluation_factor.to_param, evaluation_factor: valid_attributes }, session: valid_session
        expect(response).to redirect_to(evaluation_factor)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        evaluation_factor = EvaluationFactor.create! valid_attributes
        put :update, params: { id: evaluation_factor.to_param, evaluation_factor: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested evaluation_factor' do
      evaluation_factor = EvaluationFactor.create! valid_attributes
      expect do
        delete :destroy, params: { id: evaluation_factor.to_param }, session: valid_session
      end.to change(EvaluationFactor, :count).by(-1)
    end

    it 'redirects to the evaluation_factors list' do
      evaluation_factor = EvaluationFactor.create! valid_attributes
      delete :destroy, params: { id: evaluation_factor.to_param }, session: valid_session
      expect(response).to redirect_to(evaluation_factors_url)
    end
  end
end
