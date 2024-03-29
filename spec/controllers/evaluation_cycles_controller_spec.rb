require 'rails_helper'

RSpec.describe EvaluationCyclesController, type: :controller do
  login_user

  let(:valid_attributes) do
    {
      initial_date: DateTime.now,
      end_date:     DateTime.tomorrow
    }
  end

  let(:invalid_attributes) do
    {
      initial_date: DateTime.tomorrow,
      end_date:     DateTime.now
    }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      evaluation_cycle = EvaluationCycle.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      evaluation_cycle = EvaluationCycle.create! valid_attributes
      get :show, params: { id: evaluation_cycle.to_param }, session: valid_session
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
      evaluation_cycle = EvaluationCycle.create! valid_attributes
      get :edit, params: { id: evaluation_cycle.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new EvaluationCycle' do
        expect do
          post :create, params: { evaluation_cycle: valid_attributes }, session: valid_session
        end.to change(EvaluationCycle, :count).by(1)
      end

      it 'redirects to the created evaluation_cycle' do
        post :create, params: { evaluation_cycle: valid_attributes }, session: valid_session
        expect(response).to redirect_to(EvaluationCycle.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { evaluation_cycle: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          end_date: DateTime.now.next_week
        }
      end

      it 'updates the requested evaluation_cycle' do
        evaluation_cycle = EvaluationCycle.create! valid_attributes
        put :update, params: { id: evaluation_cycle.to_param, evaluation_cycle: new_attributes }, session: valid_session
        evaluation_cycle.reload
        expect(evaluation_cycle.end_date).to eq new_attributes[:end_date]
      end

      it 'redirects to the evaluation_cycle' do
        evaluation_cycle = EvaluationCycle.create! valid_attributes
        put :update, params: { id: evaluation_cycle.to_param, evaluation_cycle: valid_attributes }, session: valid_session
        expect(response).to redirect_to(evaluation_cycle)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        evaluation_cycle = EvaluationCycle.create! valid_attributes
        put :update, params: { id: evaluation_cycle.to_param, evaluation_cycle: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested evaluation_cycle' do
      evaluation_cycle = EvaluationCycle.create! valid_attributes
      expect do
        delete :destroy, params: { id: evaluation_cycle.to_param }, session: valid_session
      end.to change(EvaluationCycle, :count).by(-1)
    end

    it 'redirects to the evaluation_cycles list' do
      evaluation_cycle = EvaluationCycle.create! valid_attributes
      delete :destroy, params: { id: evaluation_cycle.to_param }, session: valid_session
      expect(response).to redirect_to(evaluation_cycles_url)
    end
  end
end
