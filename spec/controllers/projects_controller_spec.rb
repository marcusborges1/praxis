require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  login_user

  let(:valid_attributes) do
    {
      name:       Faker::App.name,
      leader_id:  FactoryGirl.create(:user).id,
      manager_id: FactoryGirl.create(:user).id,
      user_ids:   FactoryGirl.create_list(:user, 3).map(&:id)
    }
  end
  let(:invalid_attributes) { { name: '' } }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      project = Project.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      project = Project.create! valid_attributes
      get :show, params: { id: project.to_param }, session: valid_session
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
      project = Project.create! valid_attributes
      get :edit, params: { id: project.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Project' do
        expect do
          post :create, params: { project: valid_attributes }, session: valid_session
        end.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        post :create, params: { project: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Project.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { project: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Novo nome' } }

      it 'updates the requested project' do
        project = Project.create! valid_attributes
        put :update, params: { id: project.to_param, project: new_attributes }, session: valid_session
        project.reload
        expect(project.name).to eq(new_attributes[:name])
      end

      it 'redirects to the project' do
        project = Project.create! valid_attributes
        put :update, params: { id: project.to_param, project: valid_attributes }, session: valid_session
        expect(response).to redirect_to(project)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        project = Project.create! valid_attributes
        put :update, params: { id: project.to_param, project: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested project' do
      project = Project.create! valid_attributes
      expect do
        delete :destroy, params: { id: project.to_param }, session: valid_session
      end.to change(Project, :count).by(-1)
    end

    it 'redirects to the projects list' do
      project = Project.create! valid_attributes
      delete :destroy, params: { id: project.to_param }, session: valid_session
      expect(response).to redirect_to(projects_url)
    end
  end
end
