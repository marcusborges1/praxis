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

  let(:valid_session) { {} }

  describe "GET #edit" do
    it "returns a success response" do
      answer_group = AnswerGroup.create! valid_attributes
      get :edit, params: {id: answer_group.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_user) { FactoryGirl.create(:user) }
      let(:new_attributes) {
        {
          user_id: new_user.id
        }
      }

      it "updates the requested answer_group" do
        answer_group = AnswerGroup.create! valid_attributes
        put :update, params: {id: answer_group.to_param, answer_group: new_attributes}, session: valid_session
        answer_group.reload
        expect(answer_group.user_id).to eq new_attributes[:user_id]
      end

      it "redirects to the parent evaluation" do
        answer_group = AnswerGroup.create! valid_attributes
        put :update, params: {id: answer_group.to_param, answer_group: valid_attributes}, session: valid_session
        expect(response).to redirect_to(answer_group.evaluation)
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
end
