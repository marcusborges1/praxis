require 'rails_helper'

RSpec.describe AnswerGroupsController, type: :controller do

  login_user

  let(:valid_attributes) {
    {
      evaluation: FactoryGirl.create(:evaluation),
      user: FactoryGirl.create(:user)
    }
  }

  let(:invalid_attributes) {
    {
      evaluation: nil,
      user: nil
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
      let(:new_attributes) {
        { evaluation: FactoryGirl.create(:evaluation) }
      }

      it "updates the requested answer_group" do
        answer_group = AnswerGroup.create! valid_attributes
        put :update, params: {id: answer_group.to_param, answer_group: new_attributes}, session: valid_session
        answer_group.reload
        skip("Add assertions for updated state")
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
