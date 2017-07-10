require 'rails_helper'

RSpec.describe "AnswerGroups", type: :request do
  describe "GET /answer_groups" do
    it "works! (now write some real specs)" do
      get answer_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
