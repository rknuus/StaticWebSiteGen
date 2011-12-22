require "spec_helper"

describe SiteTextsController do
  describe "routing" do

    #FIXME: delete
    it "routes to #index" do
      get("/site_texts").should route_to("site_texts#index")
    end

    it "routes to #new" do
      get("/site_texts/new").should route_to("site_texts#new")
    end

    it "routes to #show" do
      get("/site_texts/1").should route_to("site_texts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_texts/1/edit").should route_to("site_texts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_texts").should route_to("site_texts#create")
    end

    it "routes to #update" do
      put("/site_texts/1").should route_to("site_texts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_texts/1").should route_to("site_texts#destroy", :id => "1")
    end

  end
end
