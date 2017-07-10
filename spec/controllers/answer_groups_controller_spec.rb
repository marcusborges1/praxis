require 'rails_helper'

RSpec.describe AnswerGroupsController, type: :controller do

  login_user

  let(:evaluation) { FactoryGirl.create(:evaluation) }
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) {
    {
      evaluation_id: evaluation.id,
      user_id: user.id
    }
  }

  let(:invalid_attributes) {
    {
      evaluation_id: nil,
      user_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnswerGroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      AnswerGroup.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      answer_group = AnswerGroup.create! valid_attributes
      get :show, params: {id: answer_group.to_param}, session: valid_session
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
      answer_group = AnswerGroup.create! valid_attributes
      get :edit, params: {id: answer_group.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AnswerGroup" do
        expect {
          post :create, params: {answer_group: valid_attributes}, session: valid_session
        }.to change(AnswerGroup, :count).by(1)
      end

      it "redirects to the created answer_group" do
        post :create, params: {answer_group: valid_attributes}, session: valid_session
        expect(response).to redirect_to(AnswerGroup.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {answer_group: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:evaluation) { FactoryGirl.create(:evaluation) }
      let(:new_attributes) {
        { evaluation_id: evaluation.id }
      }

      it "updates the requested answer_group" do
        answer_group = AnswerGroup.create! valid_attributes
        put :update, params: {id: answer_group.to_param, answer_group: new_attributes}, session: valid_session
        answer_group.reload
        expect(answer_group.evaluation_id).to eq new_attributes[:evaluation_id]
      end

      it "redirects to the answer_group" do
        answer_group = AnswerGroup.create! valid_attributes
        put :update, params: {id: answer_group.to_param, answer_group: valid_attributes}, session: valid_session
        expect(response).to redirect_to(answer_group)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        answer_group = AnswerGroup.create! valid_attributes
        put :update, params: {id: answer_group.to_param, answer_group: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested answer_group" do
      answer_group = AnswerGroup.create! valid_attributes
      expect {
        delete :destroy, params: {id: answer_group.to_param}, session: valid_session
      }.to change(AnswerGroup, :count).by(-1)
    end

    it "redirects to the answer_groups list" do
      answer_group = AnswerGroup.create! valid_attributes
      delete :destroy, params: {id: answer_group.to_param}, session: valid_session
      expect(response).to redirect_to(answer_groups_url)
    end
  end
end
