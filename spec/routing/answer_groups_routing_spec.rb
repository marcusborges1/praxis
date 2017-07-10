require "rails_helper"

RSpec.describe AnswerGroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/answer_groups").to route_to("answer_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/answer_groups/new").to route_to("answer_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/answer_groups/1").to route_to("answer_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/answer_groups/1/edit").to route_to("answer_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/answer_groups").to route_to("answer_groups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/answer_groups/1").to route_to("answer_groups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/answer_groups/1").to route_to("answer_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/answer_groups/1").to route_to("answer_groups#destroy", :id => "1")
    end

  end
end
