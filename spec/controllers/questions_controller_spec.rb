require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:valid_attributes) {
    {
      name: "foo", description: "bar", evaluation_factor: "baz",
      option1: "f", option2: "o", option3: "b", option4: "a"
    }
  }

  let(:invalid_attributes) {
    {
      name: "", description: "", evaluation_factor: "",
      option1: "f", option2: "o", option3: "", option4: "a"
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      question = Question.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      question = Question.create! valid_attributes
      get :show, params: {id: question.to_param}, session: valid_session
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
      question = Question.create! valid_attributes
      get :edit, params: {id: question.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, params: {question: valid_attributes}, session: valid_session
        }.to change(Question, :count).by(1)
      end

      it "redirects to the created question" do
        post :create, params: {question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Question.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {question: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "bar", description: "foo", evaluation_factor: "baz",
          option1: "f", option2: "o", option3: "b", option4: "a"
        }
      }

      it "updates the requested question" do
        question = Question.create! valid_attributes
        put :update, params: {id: question.to_param, question: new_attributes}, session: valid_session
        question.reload
        expect(question.name).to eq new_attributes[:name]
      end

      it "redirects to the question" do
        question = Question.create! valid_attributes
        put :update, params: {id: question.to_param, question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(question)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        question = Question.create! valid_attributes
        put :update, params: {id: question.to_param, question: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested question" do
      question = Question.create! valid_attributes
      expect {
        delete :destroy, params: {id: question.to_param}, session: valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = Question.create! valid_attributes
      delete :destroy, params: {id: question.to_param}, session: valid_session
      expect(response).to redirect_to(questions_url)
    end
  end

end
