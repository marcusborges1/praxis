require 'rails_helper'

RSpec.describe AnswerGroupsController, type: :controller do
  login_user

  let(:evaluation) { FactoryGirl.create(:evaluation) }
  let(:question_value) { FactoryGirl.create(:question_value, evaluation_model: evaluation.evaluation_model) }
  let(:user) { FactoryGirl.create(:user, sector: evaluation.evaluation_model.sector) }
  let(:evaluation_target) { FactoryGirl.create(:user, sector: evaluation.evaluation_model.sector) }

  let(:valid_attributes) {
    {
      evaluation_id: evaluation.id,
      evaluation_target_id: evaluation_target.id,
      user_id: @user.id
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
      answer_group = AnswerGroup.create valid_attributes
      get :edit, params: { id: answer_group.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let!(:option) { FactoryGirl.create(:option, question: question_value.question) }
      let(:answer_group) { AnswerGroup.create! valid_attributes }
      let(:answer) { answer_group.answers.first }
      before(:each) { answer.update(option: option) }
      let(:new_attributes) {
        {
          answers_attibutes: [answer]
        }
      }

      it "changes answer_group answered status to true" do
        put :update, params: {id: answer_group.to_param, answer_group: new_attributes}, session: valid_session
        answer_group.reload
        expect(answer_group.answered).to eq true
      end

      it "redirects to the parent evaluation" do
        put :update, params: {id: answer_group.to_param, answer_group: valid_attributes}, session: valid_session
        expect(response).to redirect_to(unanswered_path)
      end
    end

    context "with invalid params" do
      let(:answer_group) { AnswerGroup.create! valid_attributes }
      let!(:option) { FactoryGirl.create(:option, question: question_values.first.question) }
      let(:answer) { answer_group.answers.first }
      let!(:question_values) { FactoryGirl.create_list(:question_value, 2, evaluation_model: evaluation.evaluation_model) }
      before(:each) { answer.update(option: option) }
      let(:new_attributes) {
        {
          answers_attibutes: answer_group.answers.to_a
        }
      }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: answer_group.to_param, answer_group: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end

      it "maintains answer_group answered status false when not all answers have options" do
        put :update, params: {id: answer_group.to_param, answer_group: new_attributes}, session: valid_session
        answer_group.reload
        expect(answer_group.answered).to eq false
      end
    end
  end
end
