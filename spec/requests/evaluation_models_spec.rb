require 'rails_helper'

RSpec.describe "EvaluationModels", type: :request do
  describe "GET /evaluation_models" do
    it "works! (now write some real specs)" do
      get evaluation_models_path
      expect(response).to have_http_status(200)
    end
  end
end
