require 'rails_helper'

RSpec.describe EvaluationsController, type: :controller do
  login_user

  let(:evaluation_model) { FactoryGirl.create(:evaluation_model) }
  let(:evaluation_cycle) { FactoryGirl.create(:evaluation_cycle) }
  let(:users) { FactoryGirl.create_list(:user, 2) }

  let(:valid_attributes) {
    {
      name:                 Faker::Name.name,
      start_date:           Faker::Date.between(3.days.ago, Date.today),
      finish_date:          Faker::Date.between(2.days.ago, Date.tomorrow),
      evaluation_model_id:  evaluation_model.id,
      evaluation_cycle_id:  evaluation_cycle.id,
      reviewer_id:          users.first.id,
      evaluation_target_id: users.second.id
    }
  }

  let(:invalid_attributes) {
    {
      start_date:           nil,
      finish_date:          nil,
      evaluation_model_id:  nil
    }
  }

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
      it "creates a new Evaluation" do
        expect {
          post :create, params: {evaluation: valid_attributes}, session: valid_session
        }.to change(Evaluation, :count).by(1).and change(AnswerGroup, :count).by(1)
      end

      it "redirects to the created evaluation" do
        post :create, params: {evaluation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Evaluation.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {evaluation: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          start_date: Faker::Date.between(2.days.ago, Date.tomorrow)
        }
      }

      it "updates the requested evaluation" do
        evaluation = Evaluation.create! valid_attributes
        put :update, params: {id: evaluation.to_param, evaluation: new_attributes}, session: valid_session
        evaluation.reload
        expect(evaluation.start_date).to eq new_attributes[:start_date]
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
