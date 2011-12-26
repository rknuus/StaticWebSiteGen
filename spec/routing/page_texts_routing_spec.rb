require "spec_helper"

describe PageTextsController do
  describe "routing" do

    it "routes to #index" do
      get("/page_texts").should route_to("page_texts#index")
    end

    it "routes to #new" do
      get("/page_texts/new").should route_to("page_texts#new")
    end

    it "routes to #show" do
      get("/page_texts/1").should route_to("page_texts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/page_texts/1/edit").should route_to("page_texts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/page_texts").should route_to("page_texts#create")
    end

    it "routes to #update" do
      put("/page_texts/1").should route_to("page_texts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/page_texts/1").should route_to("page_texts#destroy", :id => "1")
    end

  end
end
