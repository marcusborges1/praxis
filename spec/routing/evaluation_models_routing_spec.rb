require "rails_helper"

RSpec.describe EvaluationModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/evaluation_models").to route_to("evaluation_models#index")
    end

    it "routes to #new" do
      expect(:get => "/evaluation_models/new").to route_to("evaluation_models#new")
    end

    it "routes to #show" do
      expect(:get => "/evaluation_models/1").to route_to("evaluation_models#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/evaluation_models/1/edit").to route_to("evaluation_models#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/evaluation_models").to route_to("evaluation_models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/evaluation_models/1").to route_to("evaluation_models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/evaluation_models/1").to route_to("evaluation_models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/evaluation_models/1").to route_to("evaluation_models#destroy", :id => "1")
    end

  end
end
